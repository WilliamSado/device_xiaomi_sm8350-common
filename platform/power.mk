# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

PRODUCT_COPY_FILES += \
    vendor/qcom/opensource/power/config/lahaina/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml
