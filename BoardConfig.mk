#
# Copyright (C) 2020 Team Win Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/juice

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a73

# Bootloader
PRODUCT_PLATFORM := bengal
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := bengal
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610
QCOM_BOARD_PLATFORMS += bengal

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_DTB_OFFSET := 0x01f00000

BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOT_HEADER_VERSION := 2

TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Assert
TARGET_OTA_ASSERT_DEVICE := citrus,lime,lemon,pomelo

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

#MIUI 12.xx A11 DECRYPTION
BOARD_AVB_RECOVERY_ADD_HASH_FOOTER_ARGS += \
    --prop com.android.build.boot.os_version:$(PLATFORM_VERSION) \
    --prop com.android.build.boot.security_patch:$(PLATFORM_SECURITY_PATCH)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 8589934592
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8589934592
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product vendor system

# System as root
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# CUSTOM_LUN_FILE
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_SCREEN_BLANK := true
PLATFORM_VERSION := 20.1.0

#SHRP Specific Stuff

SHRP_PATH := device/xiaomi/juice
SHRP_MAINTAINER := Box-Boi
SHRP_DEVICE_CODE := juice
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_only
SHRP_NOTCH := true
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /UFS_SD
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_REC := /dev/block/by-name/recovery
INC_IN_REC_MAGISK := true
SHRP_DARK := true
SHRP_OFFICIAL := true
INC_IN_REC_ADDON_1 := true
INC_IN_REC_ADDON_2 := true
INC_IN_REC_ADDON_3 := true
INC_IN_REC_ADDON_4 := true

#SHRP Addons

SHRP_EXTERNAL_ADDON_PATH := "device/xiaomi/juice/addon/"
SHRP_EXTERNAL_ADDON_1_NAME := "SELinux Permissiver"
SHRP_EXTERNAL_ADDON_1_INFO := "Makes SELinux Permissive"
SHRP_EXTERNAL_ADDON_1_FILENAME := "permissiver.zip"
SHRP_EXTERNAL_ADDON_1_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_1_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_1 := true
SHRP_EXTERNAL_ADDON_2_NAME := "SELinux Enforcer"
SHRP_EXTERNAL_ADDON_2_INFO := "Reverts Back to Enforcing SELinux"
SHRP_EXTERNAL_ADDON_2_FILENAME := "enforcer.zip"
SHRP_EXTERNAL_ADDON_2_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_2 := true
SHRP_EXTERNAL_ADDON_3_NAME := "Disable-Replace-SHRP"
SHRP_EXTERNAL_ADDON_3_INFO := "Flash in MIUI To Stop MIUI Recovery From Replacing"
SHRP_EXTERNAL_ADDON_3_FILENAME := "disable_replace_SHRP.zip"
SHRP_EXTERNAL_ADDON_3_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_2_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_3 := true
SHRP_EXTERNAL_ADDON_4_NAME := "Mount System-Vendor-Product R/W"
SHRP_EXTERNAL_ADDON_4_INFO := "Mounts System As R/W"
SHRP_EXTERNAL_ADDON_4_FILENAME := "system_vendor_product_rw.zip"
SHRP_EXTERNAL_ADDON_4_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_4_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_4 := true
SHRP_EXTERNAL_ADDON_5_NAME := "Super-Partition Cleaner"
SHRP_EXTERNAL_ADDON_5_INFO := "Fixes Problems While CleanFlashing"
SHRP_EXTERNAL_ADDON_5_FILENAME := "super-partition-cleaner.zip"
SHRP_EXTERNAL_ADDON_5_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_5_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_5 := true
SHRP_EXTERNAL_ADDON_6_NAME := "[MAGISK] SafetyNet Fix"
SHRP_EXTERNAL_ADDON_6_INFO := "A magisk module which attempts to fix Safetynet"
SHRP_EXTERNAL_ADDON_6_FILENAME := "safetynet-fix.zip"
SHRP_EXTERNAL_ADDON_6_BTN_TEXT := "Flash"
SHRP_EXTERNAL_ADDON_6_SUCCESSFUL_TEXT := "Flashed Successfully"
SHRP_INC_IN_REC_EXTERNAL_ADDON_6 := true
