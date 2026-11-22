#
# Copyright (C) 2023-2026 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# OrangeFox Configuration
export FOX_BUILD_DEVICE="a7y18lte"
export FOX_SAMSUNG_DEVICE=1
export OF_USE_LEGACY_BATTERY_SERVICES=1
export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/RECOVERY"
export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/SYSTEM"
export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/VENDOR"
export FOX_RECOVERY_BOOT_PARTITION="/dev/block/platform/13500000.dwmmc0/by-name/BOOT"
export OF_MAINTAINER="eyge102"
export OF_SCREEN_H=2220
export OF_STATUS_H=80
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CHECK_OVERWRITE_ATTEMPTS=1
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_USE_NEW_MAGISKBOOT=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_NO_MIUI_PATCHES=1
export FOX_USE_BASH_SHELL=1
export FOX_ASH_IS_BASH=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export OF_FLASHLIGHT_ENABLE=1
export OF_FL_PATH1="/flashlight"
export OF_USE_GREEN_LED=0
export FOX_DELETE_AROMAFM=1
export OF_USE_LZMA_COMPRESSION=1
export OF_UNBIND_SDCARD_F2FS=1
export FOX_LOCAL_CALLBACK_SCRIPT="/home/runner/fox/device/samsung/a7y18lte/fox_local_callback.sh"
export TW_HAS_MTP=true
export TW_MTP_DEVICE="/dev/usb-ffs/mtp"
export TW_EXCLUDE_DEFAULT_USB_INIT=true
