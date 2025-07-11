#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit proprietary targets
$(call inherit-product, vendor/xiaomi/sm8350-common/sm8350-common-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# API
$(call inherit-product, $(LOCAL_PATH)/platform/api_level.mk)

# Audio
$(call inherit-product, $(LOCAL_PATH)/platform/audio.mk)

# A/B
$(call inherit-product, $(LOCAL_PATH)/platform/vab.mk)

# Bluetooth
$(call inherit-product, $(LOCAL_PATH)/platform/bt.mk)

# Boot animation
$(call inherit-product, $(LOCAL_PATH)/platform/boot_animation.mk)

# Boot control
$(call inherit-product, $(LOCAL_PATH)/platform/bootctl.mk)

# Camera
$(call inherit-product, $(LOCAL_PATH)/platform/camera.mk)

# DebugFS
$(call inherit-product, $(LOCAL_PATH)/platform/debugfs.mk)

# Display
$(call inherit-product, $(LOCAL_PATH)/platform/display.mk)

# DRM
$(call inherit-product, $(LOCAL_PATH)/platform/drm.mk)

# Fastbootd
$(call inherit-product, $(LOCAL_PATH)/platform/fastbootd.mk)

# Fingerprint
$(call inherit-product, $(LOCAL_PATH)/platform/fingerprint.mk)

# GPS
$(call inherit-product, $(LOCAL_PATH)/platform/gps.mk)

# Graphics
$(call inherit-product, $(LOCAL_PATH)/platform/graphics.mk)

# Health
$(call inherit-product, $(LOCAL_PATH)/platform/health.mk)

# HotwordEnrollement
$(call inherit-product, $(LOCAL_PATH)/platform/hotwordenrollement.mk)

# Init
$(call inherit-product, $(LOCAL_PATH)/platform/init.mk)

# IFAA manager
$(call inherit-product, $(LOCAL_PATH)/platform/ifaa.mk)

# IPACM
$(call inherit-product, $(LOCAL_PATH)/platform/ipacm.mk)

# IR
$(call inherit-product, $(LOCAL_PATH)/platform/ir.mk)

# Kernel
$(call inherit-product, $(LOCAL_PATH)/platform/kernel.mk)

# Media
$(call inherit-product, $(LOCAL_PATH)/platform/media.mk)

# Native libraries whitelist
$(call inherit-product, $(LOCAL_PATH)/platform/native.mk)

# Network
$(call inherit-product, $(LOCAL_PATH)/platform/network.mk)

# NFC
$(call inherit-product, $(LOCAL_PATH)/platform/nfc.mk)

# Overlays
$(call inherit-product, $(LOCAL_PATH)/android/overlay.mk)

# Partitions
$(call inherit-product, $(LOCAL_PATH)/platform/partitions.mk)

# Power
$(call inherit-product, $(LOCAL_PATH)/platform/power.mk)

# PowerShare
ifeq ($(TARGET_HAS_POWERSHARE),true)
$(call inherit-product, $(LOCAL_PATH)/platform/powershare.mk)
endif

# QTI
$(call inherit-product, $(LOCAL_PATH)/platform/qti.mk)

# Sensors
$(call inherit-product, $(LOCAL_PATH)/platform/sensors.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Telephony
$(call inherit-product, $(LOCAL_PATH)/platform/telephony.mk)

# Thermal
$(call inherit-product, $(LOCAL_PATH)/platform/thermal.mk)

# TimeKeep
$(call inherit-product, $(LOCAL_PATH)/platform/timekeep.mk)

# Update engine
$(call inherit-product, $(LOCAL_PATH)/platform/update.mk)

# USB
$(call inherit-product, $(LOCAL_PATH)/platform/usb.mk)

# Vibrator
$(call inherit-product, $(LOCAL_PATH)/platform/vibrator.mk)

# VNDK
# vndservicemanager has been removed from API30 devices (aosp/1235751)
# but we still need it for display services.
$(call inherit-product, $(LOCAL_PATH)/platform/vndk.mk)

# Vulkan
$(call inherit-product, $(LOCAL_PATH)/platform/vulkan.mk)

# WiFi
$(call inherit-product, $(LOCAL_PATH)/platform/wifi.mk)