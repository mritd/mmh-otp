#!/usr/bin/env bash

set -e

GO111MODULE="on"
GOPROXY="https://goproxy.cn"
CGO_ENABLE=0
TARGET_DIR="dist"
PLATFORMS="darwin/amd64 linux/386 linux/amd64 linux/arm linux/arm64 windows/386 windows/amd64"

rm -rf ${TARGET_DIR}
mkdir ${TARGET_DIR}

for pl in ${PLATFORMS}; do
    GOOS=$(echo ${pl} | cut -d'/' -f1)
    GOARCH=$(echo ${pl} | cut -d'/' -f2)
    echo "build => ${TARGET_DIR}/mmh-otp_${GOOS}_${GOARCH}"
    go build -trimpath -ldflags "-w -s" -o ${TARGET_DIR}/mmh-otp_${GOOS}_${GOARCH}
done