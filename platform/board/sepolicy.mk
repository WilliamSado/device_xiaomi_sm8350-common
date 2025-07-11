# Sepolicy
SEPOLICY_COMMON_PATH := device/xiaomi/sm8350-common/platform/sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/sony/timekeep/sepolicy/SEPolicy.mk

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(SEPOLICY_COMMON_PATH)/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(SEPOLICY_COMMON_PATH)/public
BOARD_VENDOR_SEPOLICY_DIRS += $(SEPOLICY_COMMON_PATH)/vendor