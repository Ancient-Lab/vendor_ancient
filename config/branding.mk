# Set all versions
ION_BUILD_TYPE ?= UNOFFICIAL
ION_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
ION_PLATFORM_VERSION := 9.0
IONIZER := 1.2.d

TARGET_PRODUCT_SHORT := $(subst ion_,,$(ION_BUILD))

ifeq ($(IS_GO_VERSION), true)
ION_VERSION := ion-go-$(IONIZER)-$(ION_BUILD)-$(ION_BUILD_DATE)-$(ION_BUILD_TYPE)
ION_FINGERPRINT := ion-go/$(ION_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(ION_BUILD_DATE)
else
ION_VERSION := ion-$(IONIZER)-$(ION_BUILD)-$(ION_BUILD_DATE)-$(ION_BUILD_TYPE)
ION_FINGERPRINT := ion/$(ION_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(ION_BUILD_DATE)
endif

ION_PROPERTIES := \
    ro.ion.version=$(ION_VERSION) \
    ro.ion.build_date=$(ION_BUILD_DATE) \
    ro.ion.build_type=$(ION_BUILD_TYPE) \
    ro.ion.fingerprint=$(ION_FINGERPRINT) \
    ro.ionizer=$(IONIZER)
