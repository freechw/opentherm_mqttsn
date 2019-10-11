# autogenerated sources_list.cmakefor project(dummy_project)

set(GROUP_CORE_SRC_APP
	        Core/Src/app/startup.c
		Core/Src/app/manchester_task.c
		Core/Src/app/lan_poll_task.c
		Core/Src/app/logger_task.c
		Core/Src/app/service_task.c
		Core/Src/app/publish_task.c
		Core/Src/app/subscribe_task.c
		Core/Src/app/opentherm_task.c
)

set(GROUP_CORE_SRC_HELPERS
	        Core/Src/helpers/my_comm.c
		Core/Src/helpers/xprintf.c
		Core/Src/helpers/ascii_helpers.c
		Core/Src/helpers/watchdog.c
		Core/Src/helpers/file_io.c
		Core/Src/helpers/rtc_helpers.c
		Core/Src/helpers/ip_helpers.c
		Core/Src/helpers/CRC32_helpers.c
		Core/Src/helpers/messages.c
		Core/Src/helpers/MQTT_config_helper.c
#		Core/Src/helpers/opentherm_wrappers.c
                Core/Src/helpers/num_helpers.c
		Core/Src/helpers/logging.c
		Core/Src/helpers/myCRT.c
)

set(GROUP_CORE_SRC_JSON
	        Core/Src/json/json.c
)

set(GROUP_CORE_SRC_LAN
	        Core/Src/lan/enc28j60.c
		Core/Src/lan/lan.c
)

set(GROUP_CORE_SRC_MQTT_SN
	        Core/Src/mqtt_sn/mqtt_sn.c
)


set(GROUP_CORE_SRC_MANCHESTER
	        Core/Src/manchester/bit_queue.c
		Core/Src/manchester/manchester.c
)

set(GROUP_CORE_SRC_MQTTSNPACKET
	        Core/Src/MQTTSNPacket/MQTTSNConnectClient.c
		Core/Src/MQTTSNPacket/MQTTSNConnectServer.c
		Core/Src/MQTTSNPacket/MQTTSNDeserializePublish.c
		Core/Src/MQTTSNPacket/MQTTSNPacket.c
		Core/Src/MQTTSNPacket/MQTTSNSearchClient.c
		Core/Src/MQTTSNPacket/MQTTSNSearchServer.c
		Core/Src/MQTTSNPacket/MQTTSNSerializePublish.c
		Core/Src/MQTTSNPacket/MQTTSNSubscribeClient.c
		Core/Src/MQTTSNPacket/MQTTSNSubscribeServer.c
		Core/Src/MQTTSNPacket/MQTTSNUnsubscribeClient.c
		Core/Src/MQTTSNPacket/MQTTSNUnsubscribeServer.c
)

set(GROUP_CORE_SRC_NTP
	        Core/Src/ntp/ntp.c
)

set(GROUP_CORE_SRC_NVMEM
	        Core/Src/nvmem/nvmem.c
)

set(GROUP_CORE_SRC_TFTP
	        Core/Src/tftp/TFTP_ser_desesr.c
		Core/Src/tftp/mystrcpy.c
		Core/Src/tftp/tftp_server.c
)

set(GROUP_CORE_SRC_TINY-FS
	        Core/Src/tiny-fs/tiny-fs.c
)

set(GROUP_CORE_SRC
	        Core/Src/adc.c
		Core/Src/crc.c
		Core/Src/dma.c
		Core/Src/freertos.c
		Core/Src/gpio.c
		Core/Src/i2c.c
		Core/Src/iwdg.c
		Core/Src/main.c
		Core/Src/rtc.c
		Core/Src/spi.c

		Core/Src/tim.c
		Core/Src/usart.c
#		Core/Src/syscalls.c
)


set(GROUP_MIDDLEWARES_THIRD_PARTY_FREERTOS_SOURCE_CMSIS_RTOS
	        Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c
)

set(GROUP_MIDDLEWARES_THIRD_PARTY_FREERTOS_SOURCE
	        Middlewares/Third_Party/FreeRTOS/Source/croutine.c
		Middlewares/Third_Party/FreeRTOS/Source/event_groups.c
		Middlewares/Third_Party/FreeRTOS/Source/list.c
		Middlewares/Third_Party/FreeRTOS/Source/queue.c
		Middlewares/Third_Party/FreeRTOS/Source/tasks.c
		Middlewares/Third_Party/FreeRTOS/Source/timers.c
)
include_directories(Core/Inc)
include_directories(Core/Inc/MQTTSNPacket)
include_directories(Core/Inc/app)
include_directories(Core/Inc/mqtt_sn)
include_directories(Core/Inc/helpers)
include_directories(Core/Inc/lan)
include_directories(Core/Inc/manchester)
include_directories(Core/Inc/ntp)
include_directories(Core/Inc/nvmem)
include_directories(Core/Inc/tftp)
include_directories(Core/Inc/tiny-fs)
include_directories(Core/Inc/json)

include_directories(Drivers/CMSIS/Include)

include_directories(Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS)
include_directories(Middlewares/Third_Party/FreeRTOS/Source/include)


set(LIST_OF_SOURCES
	        ${LIST_OF_SOURCES}
		${GROUP_CORE_SRC}
		${GROUP_CORE_SRC_APP}
		${GROUP_CORE_SRC_HELPERS}
		${GROUP_CORE_SRC_LAN}
		${GROUP_CORE_SRC_MANCHESTER}
		${GROUP_CORE_SRC_MQTTSNPACKET}
		${GROUP_CORE_SRC_MQTT_SN}
		${GROUP_CORE_SRC_NTP}
		${GROUP_CORE_SRC_NVMEM}
		${GROUP_CORE_SRC_TFTP}
		${GROUP_CORE_SRC_TINY-FS}
		${GROUP_CORE_SRC_JSON}
#		${GROUP_DRIVERS_STM32F1XX_HAL_DRIVER_SRC}
                ${GROUP_MIDDLEWARES_THIRD_PARTY_FREERTOS_SOURCE}
		${GROUP_MIDDLEWARES_THIRD_PARTY_FREERTOS_SOURCE_CMSIS_RTOS}
#		${GROUP_MIDDLEWARES_THIRD_PARTY_FREERTOS_SOURCE_PORTABLE_GCC_ARM_CM3}
)

