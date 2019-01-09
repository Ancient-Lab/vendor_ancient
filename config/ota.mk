ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(ION_BUILD_TYPE), OFFICIAL)

ifeq ($(IS_GO_VERSION), true)
ION_OTA_VERSION_CODE := pie_go
else
ION_OTA_VERSION_CODE := pie
endif

CUSTOM_PROPERTIES += \
    ro.ion.ota.version_code=$(ION_OTA_VERSION_CODE)

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/ion/config/permissions/org.pixelexperience.ota.xml:system/etc/permissions/org.pixelexperience.ota.xml

endif
endif
