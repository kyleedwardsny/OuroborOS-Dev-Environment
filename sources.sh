#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${SRC_DIR}"

get_src()
{
	SRC_FILE="$1"
	URL="$2"
	test -f "${SRC_DIR}/${SRC_FILE}" || wget -O "${SRC_DIR}/${SRC_FILE}" "${URL}"
}

extract_src_xz()
{
	EXTRACTED_DIR="$1"
	SRC_FILE="$2"
	test -d "${SRC_DIR}/${EXTRACTED_DIR}" || tar -xJf "${SRC_DIR}/${SRC_FILE}" -C "${SRC_DIR}"
}

get_src "${BINUTILS_VERSION}.tar.xz" "https://ftp.gnu.org/gnu/binutils/${BINUTILS_VERSION}.tar.xz"
get_src "${GCC_VERSION}.tar.xz" "ftp://ftp.gnu.org/gnu/gcc/${GCC_VERSION}/${GCC_VERSION}.tar.xz"
get_src "${GDB_VERSION}.tar.xz" "https://ftp.gnu.org/gnu/gdb/${GDB_VERSION}.tar.xz"
get_src "${QEMU_VERSION}.tar.xz" "https://download.qemu.org/${QEMU_VERSION}.tar.xz"

cd "${SRC_DIR}"
sha256sum --quiet -c "${ROOT_DIR}/checksums.txt"
cd "${OUTPUT_DIR}"

extract_src_xz "${BINUTILS_VERSION}" "${BINUTILS_VERSION}.tar.xz"
extract_src_xz "${GCC_VERSION}" "${GCC_VERSION}.tar.xz"
extract_src_xz "${GDB_VERSION}" "${GDB_VERSION}.tar.xz"
extract_src_xz "${QEMU_VERSION}" "${QEMU_VERSION}.tar.xz"
