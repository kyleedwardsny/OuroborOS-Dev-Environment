#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${BUILD_DIR}"

extract_src_xz()
{
	EXTRACTED_DIR="$1"
	SRC_FILE="$2"
	test -d "${BUILD_DIR}/${EXTRACTED_DIR}" || tar -xJf "${SRC_DIR}/${SRC_FILE}" -C "${BUILD_DIR}"
}

extract_src_xz binutils-2.29.1 binutils-2.29.1.tar.xz
extract_src_xz gcc-7.2.0 gcc-7.2.0.tar.xz
extract_src_xz gdb-8.0.1 gdb-8.0.1.tar.xz
extract_src_xz qemu-2.10.1 qemu-2.10.1.tar.xz
