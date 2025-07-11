#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/xiaomi/sm8350-common
BOARD_CONFIG_COMMON_PATH := $(COMMON_PATH)/platform/board

# Architecture
include $(BOARD_CONFIG_COMMON_PATH)/arch.mk

# Audio
include $(BOARD_CONFIG_COMMON_PATH)/audio.mk

# Board
include $(BOARD_CONFIG_COMMON_PATH)/board.mk

# Filesystem
include $(BOARD_CONFIG_COMMON_PATH)/filesystem.mk

# GPS
include $(BOARD_CONFIG_COMMON_PATH)/gps.mk

# HIDL
include $(BOARD_CONFIG_COMMON_PATH)/hidl.mk

# Kernel
include $(BOARD_CONFIG_COMMON_PATH)/kernel.mk

# Partition
include $(BOARD_CONFIG_COMMON_PATH)/partitions.mk

# Power
include $(BOARD_CONFIG_COMMON_PATH)/power.mk

# Properties
include $(BOARD_CONFIG_COMMON_PATH)/properties.mk

# Recovery
include $(BOARD_CONFIG_COMMON_PATH)/recovery.mk

# RIL
include $(BOARD_CONFIG_COMMON_PATH)/ril.mk

# Sepolicy
include $(BOARD_CONFIG_COMMON_PATH)/sepolicy.mk

# Verified Boot
include $(BOARD_CONFIG_COMMON_PATH)/vbmeta.mk

# WiFi
include $(BOARD_CONFIG_COMMON_PATH)/wifi.mk

# Inherit proprietary blobs
include vendor/xiaomi/sm8350-common/BoardConfigVendor.mk
