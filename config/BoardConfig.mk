include vendor/ancient/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/ancient/config/BoardConfigQcom.mk
endif

include vendor/ancient/config/BoardConfigSoong.mk
