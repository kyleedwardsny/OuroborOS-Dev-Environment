#!/bin/sh

set -e

ROOT_DIR=$(dirname "$0")
. "${ROOT_DIR}/build-common.sh"

mkdir -p "${TOOLS_DIR}"

mkdir -p "${BUILD_DIR}/qemu-build"
cd "${BUILD_DIR}/qemu-build"
"${SRC_DIR}/${QEMU_VERSION}/configure" --target-list=arm-softmmu,aarch64-softmmu --prefix="${TOOLS_DIR}"
make
make install
cd "${OUTPUT_DIR}"
