#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/binutils-build"
cd "${BUILD_DIR}/binutils-build"
"${SRC_DIR}/${BINUTILS_VERSION}/configure" --prefix="${TOOLS_DIR}" --disable-nls --disable-werror
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"

mkdir -p "${BUILD_DIR}/gcc-build"
cd "${BUILD_DIR}/gcc-build"
"${SRC_DIR}/${GCC_VERSION}/configure" --prefix="${TOOLS_DIR}" --disable-nls --enable-languages=c,c++ --disable-multilib
make "$@"
make "$@" install
cd "${OUTPUT_DIR}"
