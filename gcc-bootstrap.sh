#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/binutils-build"
cd "${BUILD_DIR}/binutils-build"
../binutils-2.29.1/configure --prefix="${TOOLS_DIR}" --disable-nls --disable-werror
make
make install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/gcc-build"
cd "${BUILD_DIR}/gcc-build"
../gcc-7.2.0/configure --prefix="${TOOLS_DIR}" --disable-nls --enable-languages=c,c++ --disable-multilib
make
make install
cd "${OUTPUT_DIR}"
