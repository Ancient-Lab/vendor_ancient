include vendor/ion/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/ion/config/BoardConfigQcom.mk
endif

include vendor/ion/config/BoardConfigSoong.mk
