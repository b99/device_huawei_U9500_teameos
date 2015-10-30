#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
# Copyright (C) 2013-2015 ShevT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

COMMON_FOLDER := device/huawei/front

$(call inherit-product, hardware/ti/omap4_front/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_CHARACTERISTICS := default
DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio Packages
PRODUCT_PACKAGES += \
    tinycap \
    tinymix \
    tinyplay \
    libtinyalsa \
    libaudioutils

# Hardware HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    audio.primary.omap4 \
    gralloc.omap4.so \
    camera.omap4 \
    lights.omap4

# Init scripts
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/rootdir/init.front.rc:root/init.front.rc \
    $(COMMON_FOLDER)/rootdir/init.front.usb.rc:root/init.front.usb.rc \
    $(COMMON_FOLDER)/rootdir/ueventd.front.rc:root/ueventd.front.rc \
    $(COMMON_FOLDER)/rootdir/fstab.front:root/fstab.front

# init.d
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/prebuilt/etc/init.d/11frandom:system/etc/init.d/11frandom

# Media / Audio
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    $(COMMON_FOLDER)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_FOLDER)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_FOLDER)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_FOLDER)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/eos_front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/cm_front_audio_config.conf:system/etc/huawei/audio/aosp_front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
    $(COMMON_FOLDER)/configs/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/gps.conf:system/etc/gps.conf \
    $(COMMON_FOLDER)/configs/gpsconfig.xml:system/etc/gpsconfig.xml

# WiFi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

# Common
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs \
    e2fsck \
    com.android.future.usb.accessory

# Utilities
PRODUCT_PACKAGES += \
    remount \
    optimizedb \
    optimizestorage

PRODUCT_PACKAGES += \
    CMFileManager

# Network tools
PRODUCT_PACKAGES += \
    libpcap \
    tcpdump

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Charging mode
PRODUCT_PACKAGES += \
    charger_res_images

# Key maps
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
    $(COMMON_FOLDER)/configs/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
    $(COMMON_FOLDER)/configs/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
    $(COMMON_FOLDER)/configs/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/bootanimation/720.zip:system/media/bootanimation.zip

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    persist.adb.notify=0 \
    persist.call_recording.enabled=1

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    persist.sys.root_access=3 \
    ro.debuggable=1 \
    persist.sys.usb.config=mtp \
    ro.selinux=permissive

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Disable VFR support for encoders
PRODUCT_PROPERTY_OVERRIDES += \
    debug.vfr.enable=0

# Avoids retrying for an EGL config w/o EGL_SWAP_BEHAVIOR_PRESERVED
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true \

# Low-RAM optimizations
ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.low_ram=true \
    persist.sys.force_highendgfx=true \
    dalvik.vm.jit.codecachesize=0 \
    config.disable_atlas=true \
    ro.config.max_starting_bg=8 \
    ro.sys.fw.bg_apps_limit=16

# Disabling strict mode
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
