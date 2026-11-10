#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

add_lunch_combo omni_a7y18lte-user
add_lunch_combo omni_a7y18lte-userdebug
add_lunch_combo omni_a7y18lte-eng

# OrangeFox Configuration
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
export OF_FL_PATH1="/sys/class/camera/flash/rear_torch_flash"
export OF_USE_GREEN_LED=0
export FOX_DELETE_AROMAFM=1
export OF_ENABLE_LPTOOLS=1
export TW_USE_CONFIGFS=true
