#!/bin/bash

SUPPORTED_ARCHITECTURES=(armeabi arm64-v8a armeabi-v7a armeabi-v7a-neon x86 x86_64)
ANDROID_NDK_ROOT_PATH=${ANDROID_NDK}
if [[ -z "$ANDROID_NDK_ROOT_PATH" ]]; then
  echo "You need to set ANDROID_NDK environment variable, please check instructions"
  exit
fi

ANDROID_API_VERSION=15
NDK_TOOLCHAIN_ABI_VERSION=4.9

NUMBER_OF_CORES=$(nproc)
HOST_UNAME=$(uname -m)
TARGET_OS=linux

CFLAGS='-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fno-strict-overflow -fstack-protector-all'
#LDFLAGS='-Wl,-z,relro -Wl,-z,now -pie'
LDFLAGS='-Wl,-z,relro'

FFMPEG_PKG_CONFIG="$(pwd)/ffmpeg-pkg-config"
