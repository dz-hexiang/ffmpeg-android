#!/bin/bash

. abi_settings.sh $1 $2 $3

pushd x264

make clean

case $1 in
  armeabi | armeabi-v7a | armeabi-v7a-neon)
    HOST=arm-linux
  ;;
   arm64-v8a)
    HOST=aarch64-linux
  ;;
  x86)
    HOST=i686-linux
  ;;
  x86_64)
    HOST=x86_64-linux
  ;;

esac

echo $CFLAGS

./configure \
  --cross-prefix="$CROSS_PREFIX" \
  --sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --enable-pic \
  --enable-static \
  --disable-shared \
  --disable-opencl \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --disable-cli || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
