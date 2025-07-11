# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

PRODUCT_PACKAGES += \
    LineageSDKOverlayPowerShare

$(call soong_config_set,lineage_powershare,powershare_path,/sys/class/qcom-battery/reverse_chg_mode)