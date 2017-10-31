#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/arm-eabi-gdb-build"
cd "${BUILD_DIR}/arm-eabi-gdb-build"
"${SRC_DIR}/${GDB_VERSION}/configure" --target=arm-eabi --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/aarch64-elf-gdb-build"
cd "${BUILD_DIR}/aarch64-elf-gdb-build"
"${SRC_DIR}/${GDB_VERSION}/configure" --target=aarch64-elf --prefix="${TOOLS_DIR}" --with-arch=armv8-a --disable-nls
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"
