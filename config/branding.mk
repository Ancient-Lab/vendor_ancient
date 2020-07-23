ifndef ANCIENT_BUILD_TYPE
    ANCIENT_BUILD_TYPE := PREHISTORIC
endif

# Set all versions
CURRENT_DEVICE=$(shell echo "$(PRODUCT_DEVICE)" | cut -d'_' -f 2,3)
ANCIENT_DATE_YEAR := $(shell date +%Y)
ANCIENT_DATE_MONTH := $(shell date +%m)
ANCIENT_DATE_DAY := $(shell date +%d)
ANCIENT_DATE_HOUR := $(shell date +%H)
ANCIENT_DATE_MINUTE := $(shell date +%M)
ANCIENT_BUILD_DATE_UTC := $(shell date -d '$(ANCIENT_DATE_YEAR)-$(ANCIENT_DATE_MONTH)-$(ANCIENT_DATE_DAY) $(ANCIENT_DATE_HOUR):$(ANCIENT_DATE_MINUTE) UTC' +%s)
ANCIENT_BUILD_DATE := $(ANCIENT_DATE_YEAR)$(ANCIENT_DATE_MONTH)$(ANCIENT_DATE_DAY)-$(ANCIENT_DATE_HOUR)$(ANCIENT_DATE_MINUTE)

ANCIENT_PLATFORM_VERSION := 10.0
ANCIENT_BASE_EDITION := CIVILIZATION
ANCIENT_VERSION_CUSTOM := CIVILIZATION-v3.9
BUILD_VERSION := v3.9

ifeq ($(ANCIENT_OFFICIAL), true)
   LIST = $(shell cat vendor/ancient/ancient.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      ANCIENT_BUILD_TYPE := PRIMEVAL

# OTA
ifeq ($(FORCE_OTA), true)
include vendor/ancient/config/ota.mk
endif

    endif
    ifneq ($(IS_OFFICIAL), true)
       ANCIENT_BUILD_TYPE := PREHISTORIC
       $(error Device is not official "$(FOUND)")
    endif
endif

TARGET_PRODUCT_SHORT := $(subst ancient_,,$(ANCIENT_BUILD))

ifeq ($(ANCIENT_NOGAPPS), true)
ANCIENT_VERSION := AncientOS-$(ANCIENT_BASE_EDITION)-$(BUILD_VERSION)-$(ANCIENT_BUILD)-$(ANCIENT_BUILD_TYPE)-$(ANCIENT_BUILD_DATE)-Vanilla
else
ANCIENT_VERSION := AncientOS-$(ANCIENT_BASE_EDITION)-$(BUILD_VERSION)-$(ANCIENT_BUILD)-$(ANCIENT_BUILD_TYPE)-$(ANCIENT_BUILD_DATE)-GApps
endif

ANCIENT_PROPERTIES := \
    ro.ancient.custom.version=$(ANCIENT_VERSION_CUSTOM) \
    ro.ancient.version=$(ANCIENT_VERSION) \
    ro.ancient.build_date=$(ANCIENT_BUILD_DATE) \
    ro.ancient.build_type=$(ANCIENT_BUILD_TYPE) \
    ro.ancient.release_type=$(ANCIENT_BUILD_TYPE)
