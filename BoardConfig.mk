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

# exynos7870 OSS audio hal
BOARD_USES_EXYNOS7870_TFA_AMP := true
TARGET_AUDIOHAL_VARIANT := gtaxl-common

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_HAS_QCA_BT_ROME := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
QCOM_BT_USE_SMD_TTY := true

# Device Manifest
DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/configs/manifest.xml

# misc
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true

# Init
TARGET_INIT_VENDOR_LIB := //$(LOCAL_PATH):libinit_gtaxlwifi
TARGET_RECOVERY_DEVICE_MODULES := libinit_gtaxlwifi

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools

# device sepolicy
# BOARD_SEPOLICY_DIRS := $(LOCAL_PATH)/sepolicy

# Display
TARGET_SCREEN_DENSITY := 240

# Kernel
TARGET_KERNEL_CONFIG := lineage-gtaxlwifi_defconfig

# OTA assertions
TARGET_OTA_ASSERT_DEVICE := gtaxlwifi

# WiFi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WPA_SUPPLICANT_VERSION := VER_0_8_X
WPA_SUPPLICANT_USE_HIDL := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_AVOID_IFACE_RESET_MAC_CHANGE := true

# inherit from common
-include device/samsung/universal7870-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/gtaxlwifi/BoardConfigVendor.mk
