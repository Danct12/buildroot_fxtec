#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
DEVICEINFO_CFG="${BOARD_DIR}/deviceinfo"

if [ ! -f ${DEVICEINFO_CFG} ]
then
	echo "${DEVICEINFO_CFG} doesn't exist. Cannot proceed."
	exit 1
fi

# We adapt postmarketOS deviceinfo here because we like it. <3
source ${DEVICEINFO_CFG}

# Append DTB to compressed kernel image.
# This is what Qualcomm bootloaders likes.
cat ${BINARIES_DIR}/Image.gz ${BINARIES_DIR}/*.dtb > ${BINARIES_DIR}/Image.gz-dtb

# Make a flashable Android boot image
${HOST_DIR}/bin/mkbootimg \
	--kernel ${BINARIES_DIR}/Image.gz-dtb \
	--base "${deviceinfo_flash_offset_base}" \
	--kernel_offset "${deviceinfo_flash_offset_kernel}" \
	--ramdisk_offset "${deviceinfo_flash_offset_ramdisk}" \
	--second_offset "${deviceinfo_flash_offset_second}" \
	--tags_offset "${deviceinfo_flash_offset_tags}" \
	--pagesize "${deviceinfo_flash_pagesize}" \
	--cmdline "${deviceinfo_kernel_cmdline}" \
	-o "${BINARIES_DIR}/boot.img"

exit $?
