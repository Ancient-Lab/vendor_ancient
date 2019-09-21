include vendor/ion/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/ion/config/BoardConfigQcom.mk
else

ifneq ($(FORCE_QCOM_DISPLAY_HAL_VARIANT),)
include vendor/ion/config/BoardConfigQcomDisplayOverride.mk
endif

endif

include vendor/ion/config/BoardConfigSoong.mk
