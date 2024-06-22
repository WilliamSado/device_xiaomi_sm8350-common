#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=mars
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

ONLY_FIRMWARE=
KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        --only-firmware )
                ONLY_FIRMWARE=true
                ;;
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/etc/camera/pureShot_parameter.xml \
        |vendor/etc/camera/pureView_parameter.xml)
            sed -i 's/=\([0-9]\+\)>/="\1">/g' "${2}"
            ;;
        vendor/lib64/hw/camera.qcom.so)
            sed -i "s/\x73\x74\x5F\x6C\x69\x63\x65\x6E\x73\x65\x2E\x6C\x69\x63/\x63\x61\x6D\x65\x72\x61\x5F\x63\x6E\x66\x2E\x74\x78\x74/g" "${2}"
            ;;
        vendor/etc/camera/star_motiontuning.xml|vendor/etc/camera/mars_motiontuning.xml)
            sed -i 's/xml=version/xml\ version/g' "${2}"
            ;;
        vendor/lib64/hw/camera.xiaomi.so)
            "${SIGSCAN}" -p "5e 07 00 94" -P "1F 20 03 D5" -f "${2}"
            ;;
        vendor/lib64/vendor.xiaomi.hardware.cameraperf@1.0-impl.so)
            "${SIGSCAN}" -p "21 00 80 52 7c 00 00 94" -P "21 00 80 52 1F 20 03 D5" -f "${2}"
            ;;
        vendor/etc/media_lahaina/video_system_specs.json)
            sed -i "/max_retry_alloc_output_timeout/ s/10000/0/" "${2}"
            ;;
        vendor/lib64/android.hardware.secure_element@1.0-impl.so)
            "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
            ;;
    esac
}

function prepare_firmware() {
    if [ "${SRC}" != "adb" ]; then
        local STAR="${ANDROID_ROOT}"/lineage/scripts/motorola/star.sh
        for IMAGE in bootloader radio; do
            if [ -f "${SRC}/${IMAGE}.img" ]; then
                echo "Extracting Motorola star image ${SRC}/${IMAGE}.img"
                sh "${STAR}" "${SRC}/${IMAGE}.img" "${SRC}"
            fi
        done
    fi
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

if [ -z "${ONLY_FIRMWARE}" ]; then
    extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

if [ -z "${SECTION}" ]; then
    extract_firmware "${MY_DIR}/proprietary-firmware.txt" "${SRC}"
fi

"${MY_DIR}/setup-makefiles.sh"