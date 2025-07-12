# HIDL
MANIFEST_COMMON_PATH := device/xiaomi/sm8350-common/platform/hidl
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    hardware/xiaomi/vintf/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE := \
    $(MANIFEST_COMMON_PATH)/manifest_lahaina.xml \
    $(MANIFEST_COMMON_PATH)/manifest_xiaomi.xml

ifeq ($(TARGET_HAS_UDFPS),true)
DEVICE_MANIFEST_FILE += \
    $(MANIFEST_COMMON_PATH)/manifest_udfps.xml
endif