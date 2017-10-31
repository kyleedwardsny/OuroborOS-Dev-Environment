#!/bin/sh

ROOT_DIR=$(dirname "$0")
OUTPUT_DIR="$(pwd)"
(echo "${ROOT_DIR}" | egrep -q '^/') || ROOT_DIR="${OUTPUT_DIR}/${ROOT_DIR}"
SRC_DIR="${OUTPUT_DIR}/src"
BUILD_DIR="${OUTPUT_DIR}/build"
TOOLS_DIR="${OUTPUT_DIR}/tools"

BINUTILS_VERSION="binutils-2.29.1"
GCC_VERSION="gcc-7.2.0"
GDB_VERSION="gdb-8.0.1"
QEMU_VERSION="qemu-2.10.1"

export PATH="${TOOLS_DIR}/bin:${PATH}"
