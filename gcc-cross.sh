#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/arm-eabi-binutils-build"
cd "${BUILD_DIR}/arm-eabi-binutils-build"
../binutils-2.29.1/configure --target=arm-eabi --prefix="${TOOLS_DIR}" --with-arch=armv8-a --with-sysroot --disable-nls --disable-werror
make
make install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/arm-eabi-gcc-build"
cd "${BUILD_DIR}/arm-eabi-gcc-build"
../gcc-7.2.0/configure --target=arm-eabi --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/aarch64-elf-binutils-build"
cd "${BUILD_DIR}/aarch64-elf-binutils-build"
../binutils-2.29.1/configure --target=aarch64-elf --prefix="${TOOLS_DIR}" --with-arch=armv8-a --with-sysroot --disable-nls --disable-werror
make
make install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/aarch64-elf-gcc-build"
cd "${BUILD_DIR}/aarch64-elf-gcc-build"
../gcc-7.2.0/configure --target=aarch64-elf --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
cd "${OUTPUT_DIR}"
