ifeq ($(ION_BUILD_TYPE), OFFICIAL)

ION_OTA_VERSION_CODE := ten

CUSTOM_PROPERTIES += \
    ro.ion.ota.version_code=$(ION_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/ion/config/permissions/com.ion.ota.xml:system/etc/permissions/com.ion.ota.xml

endif
