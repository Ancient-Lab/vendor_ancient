# Set all versions
ION_BUILD_TYPE ?= UNOFFICIAL
ION_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
ION_PLATFORM_VERSION := 10.0
IONIZER := 2.0.a

TARGET_PRODUCT_SHORT := $(subst ion_,,$(ION_BUILD))

ION_VERSION := ion-$(IONIZER)-$(ION_BUILD)-$(ION_BUILD_DATE)-$(ION_BUILD_TYPE)
ION_FINGERPRINT := ion/$(ION_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(ION_BUILD_DATE)

ION_PROPERTIES := \
    ro.ion.version=$(ION_VERSION) \
    ro.ion.build_date=$(ION_BUILD_DATE) \
    ro.ion.build_type=$(ION_BUILD_TYPE) \
    ro.ion.fingerprint=$(ION_FINGERPRINT) \
    ro.ionizer=$(IONIZER)
