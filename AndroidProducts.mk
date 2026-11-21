#
# Copyright (C) 2023-2026 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_a7y18lte.mk \
    $(LOCAL_DIR)/omni_a7y18lte.mk

COMMON_LUNCH_CHOICES := \
    twrp_a7y18lte-user \
    twrp_a7y18lte-userdebug \
    twrp_a7y18lte-eng \
    omni_a7y18lte-user \
    omni_a7y18lte-userdebug \
    omni_a7y18lte-eng
