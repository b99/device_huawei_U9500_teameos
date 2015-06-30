# boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, device/huawei/front/device.mk)
$(call inherit-product, vendor/eos/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := front
PRODUCT_NAME := eos_front
PRODUCT_RELEASE_NAME := U9500
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U9500
PRODUCT_MANUFACTURER := Huawei
