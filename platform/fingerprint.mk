# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi

ifeq ($(TARGET_HAS_UDFPS),true)
PRODUCT_PACKAGES += \
    libudfpshandler \
    sensors.xiaomi.v2

PRODUCT_PACKAGES += \
    FrameworkOverlayUDFPS

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.sensors.xiaomi.udfps=true
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml
