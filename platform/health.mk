# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

$(call soong_config_set,lineage_health,charging_control_supports_bypass,false)