# Inherit some common CM stuff.
$(call inherit-product, vendor/eos/config/common_full_phone.mk)
$(call inherit-product, device/huawei/front/device.mk)

# Release name
PRODUCT_RELEASE_NAME := front

# Bootanimation settings
TARGET_BOOTANIMATION_PRELOAD := false
TARGET_BOOTANIMATION_TEXTURE_CACHE := false
TARGET_BOOTANIMATION_USE_RGB565 := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := front
PRODUCT_NAME := full_front
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9500
PRODUCT_MANUFACTURER := Huawei

# Set build fingerprint / ID / Product Name etc.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=front
