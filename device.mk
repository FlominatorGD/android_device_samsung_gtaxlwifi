#
# Copyright (C) 2022 The LineageOS Project
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

LOCAL_PATH := device/samsung/gtaxlwifi

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.gps.rc \
    init.wifi_device.rc

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/gps.xml

# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/544nits_config/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libcld80211 \
    libwifi-hal \
    libwpa_client \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

#hostpad
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0

#wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.4

#supplicant
PRODUCT_PACKAGES += \
    android.hardware.wifi.supplicant@1.3

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/grippower.info:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/grippower.info \
    $(LOCAL_PATH)/configs/wifi/qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Inherit from gtaxl-common
$(call inherit-product, device/samsung/universal7870-common/device-common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/samsung/gtaxlwifi/gtaxlwifi-vendor.mk)
