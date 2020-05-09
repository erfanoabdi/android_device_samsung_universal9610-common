#
# Copyright (C) 2018 The LineageOS Project
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

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifneq ($(findstring lineage, $(TARGET_PRODUCT)),)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
endif

# SP-NDK
PRODUCT_PACKAGES += \
    libvulkan

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/29/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# FM radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Init
PRODUCT_PACKAGES += \
    init.samsung.rc \
    init.usb_accessory.rc

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service.samsung-exynos

# LPM
PRODUCT_PACKAGES += \
    libsuspend

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.exynos9610.rc \
    init.recovery.exynos9611.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl.9610

# Trust HAL
PRODUCT_PACKAGES += \
    lineage.trust@1.0-service

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio_keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio_keys.kl

# Soong
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Property overrides
-include $(LOCAL_PATH)/product_prop.mk

# Call proprietary blob setup
$(call inherit-product, vendor/samsung/universal9610-common/universal9610-common-vendor.mk)
