/**
 * @file ntp.c
 * @author Vasiliy Turchenko
 * @author (C) 2014 David Lettier
 * @date 10-Feb-2017
 * @version 0.0.1
 *
 */

#include <time.h>

#include "FreeRTOS.h"
#include "task.h"

#include "lan.h"

#include "logging.h"
#include "rtc_helpers.h"
#include "tiny-fs.h"
#include "ip_helpers.h"

#include "ntp.h"
#include "debug_settings.h"

ErrorStatus NTP_sync(ip_pair_t serv)
{
	ntp_packet NTP_packet;
	ErrorStatus result;
	result = ERROR;

	TaskHandle_t	taskHandle = xTaskGetCurrentTaskHandle();

	memset(&NTP_packet, 0, sizeof(ntp_packet));
	/* Set the first byte's bits to 00,011,011 for li = 0, vn = 3, and mode = 3. The rest will be left set to zero. */
	*((char *)&NTP_packet + 0) =
		0x1b; /* Represents 27 in base 10 or 00011011 in base 2. */
	socket_p ntpsoc;
	ntpsoc = NULL;
	ntpsoc = bind_socket(serv.ip, serv.port, 0, SOC_MODE_WRITE);
	if (ntpsoc == NULL) {
		goto fExit;
	}

	/* Call up the server using its IP address and port number. */
	if (write_socket(ntpsoc, (uint8_t *)&NTP_packet, sizeof(NTP_packet)) !=
	    SUCCESS) {
		close_socket(ntpsoc);
		goto fExit;
	}

	if (change_soc_mode(ntpsoc, SOC_MODE_READ) == NULL) {
		goto fExit; /* error with socket */
	}


	if (set_notif_params(ntpsoc, taskHandle, 500U) == NULL) {
		goto fExit; /* error with socket */
	}

	/*read with wait */
	uint16_t len;
	len = read_socket(ntpsoc, (uint8_t *)&NTP_packet, sizeof(NTP_packet));
	close_socket(ntpsoc);
	if (len != sizeof(NTP_packet)) {
		goto fExit;
	}

	/* the packet of correct length was received */

	/* These two fields contain the time-stamp seconds as the packet left the NTP server. */
	/* The number of seconds correspond to the seconds passed since 1900. */
	/* ntohl() converts the bit/byte order from the network's to host's "endianness". */

	NTP_packet.txTm_s = ntohl(NTP_packet.txTm_s); /* Time-stamp seconds. */
	NTP_packet.txTm_f =
		ntohl(NTP_packet.txTm_f); /* Time-stamp fraction of a second. */

	/* add fractions!*/

	/* Extract the 32 bits that represent the time-stamp seconds (since NTP epoch) from when the packet left the server. */
	/* Subtract 70 years worth of seconds from the seconds since 1900. */
	/* This leaves the seconds since the UNIX epoch of 1970. */

	NTP_packet.txTm_s -= NTP_TIMESTAMP_DELTA;
	result = SUCCESS;
	/* leap seconds since 1970 = 27 */
	//	const	uint32_t	leapsec = 27U;
	tTime NTP_time;
	NTP_time.Seconds = NTP_packet.txTm_s;
	NTP_time.mSeconds = 0U;

	if (SaveTimeToRTC(&NTP_time) != SUCCESS) {
#ifdef NTP_DEBUG_PRINT
		log_xputs(MSG_LEVEL_SERIOUS, "ntp.c time saving error!");
#endif
		result = ERROR;
	} else {
#ifdef NTP_DEBUG_PRINT
		log_xputs(MSG_LEVEL_INFO, "ntp.c time sync OK!");
#endif
	}

#ifdef NTP_DEBUG_PRINT
	NTP_time.Seconds = 0U;
	GetTimeFromRTC(&NTP_time);
	log_xprintf(MSG_LEVEL_INFO, "NTP seconds: %d\n", NTP_time.Seconds);
#endif
fExit:
	return result;
}

#undef NTP_DEBUG

/* ##########################  EOF  ##########################*/
