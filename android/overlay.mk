# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    CarrierConfigOverlaySM8350 \
    DialerOverlaySM8350 \
    LineageSDKOverlaySM8350 \
    TelephonyOverlaySM8350

PRODUCT_PACKAGES += \
    FrameworkOverlaySM8350 \
    NcmTetheringOverlay \
    SettingsOverlaySM8350 \
    SystemUIOverlaySM8350 \
    WifiOverlaySM8350

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/overlay/config-vendor.xml:$(TARGET_COPY_OUT_VENDOR)/overlay/config/config.xml