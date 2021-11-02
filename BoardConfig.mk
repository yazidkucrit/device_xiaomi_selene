#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/selene

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6768
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := mt6768
PRODUCT_PLATFORM := mt6768

# A/B
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true

# A/B
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    logo \
    md1img \
    preloader \
    product \
    scp \
    spmfw \
    sspm \
    system \
    tee \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := selene

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := Image.gz

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_KERNEL_SEPERATED_DTBO := true

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Partition
BOARD_DTBOIMAGE_PARTITION_SIZE := 0x800000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9126805504
BOARD_MAIN_PARTITION_LIST := system vendor product
TARGET_COPY_OUT_VENDOR := vendor
    
# File system type
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Treble
BOARD_VNDK_VERSION := current

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

#MIUI 12.xx A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_METADATA_ENCRYPTION := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
    
# TWRP Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_NTFS_3G := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_Y_OFFSET := 80
TW_H_OFFSET := -80
TW_HAS_MTP := true
TW_NO_SCREEN_BLANK := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_INCLUDE_REPACKTOOLS := true
TW_LOAD_VENDOR_MODULES := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_FB2PNG := true
TW_DEVICE_VERSION := KeongBalap™
