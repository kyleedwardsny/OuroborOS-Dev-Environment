#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/arm-eabi-binutils-build"
cd "${BUILD_DIR}/arm-eabi-binutils-build"
"${SRC_DIR}/${BINUTILS_VERSION}/configure" --target=arm-eabi --prefix="${TOOLS_DIR}" --with-arch=armv8-a --with-sysroot --disable-nls --disable-werror
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/arm-eabi-gcc-build"
cd "${BUILD_DIR}/arm-eabi-gcc-build"
"${SRC_DIR}/${GCC_VERSION}/configure" --target=arm-eabi --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls --enable-languages=c,c++ --without-headers
make "$@" all-gcc
make "$@" all-target-libgcc
make "$@" install-gcc
make "$@" install-target-libgcc
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/aarch64-elf-binutils-build"
cd "${BUILD_DIR}/aarch64-elf-binutils-build"
"${SRC_DIR}/${BINUTILS_VERSION}/configure" --target=aarch64-elf --prefix="${TOOLS_DIR}" --with-arch=armv8-a --with-sysroot --disable-nls --disable-werror
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/aarch64-elf-gcc-build"
cd "${BUILD_DIR}/aarch64-elf-gcc-build"
"${SRC_DIR}/${GCC_VERSION}/configure" --target=aarch64-elf --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls --enable-languages=c,c++ --without-headers
make "$@" all-gcc
make "$@" all-target-libgcc
make "$@" install-gcc
make "$@" install-target-libgcc
cd "${OUTPUT_DIR}"
