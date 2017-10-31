#!/bin/sh

ROOT_DIR=$(dirname "$0")
SRC_DIR="${ROOT_DIR}/src"
OUTPUT_DIR="$(pwd)"
BUILD_DIR="${OUTPUT_DIR}/build"
TOOLS_DIR="${OUTPUT_DIR}/tools"

export PATH="${TOOLS_DIR}/bin:${PATH}"
