#! /bin/bash

export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"

DATETIME=$(date +%Y%m%d%H%M%S)
START=$(date +%s)
EXEC_USER=$(whoami)
MULTI_TRAP_TMPDIR=$(mktemp -d)

SCRIPT_PARENT_DIR=$(cd "${SCRIPT_DIR}";cd ..;pwd)
SCRIPT_BIN_DIR="${SCRIPT_DIR}/bin"
SCRIPT_TMP_DIR="${SCRIPT_DIR}/tmp"
CURL_TIMEOUT=15
