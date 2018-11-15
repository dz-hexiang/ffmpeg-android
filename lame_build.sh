#!/bin/bash

. abi_settings.sh $1 $2 $3

#pushd lame-3.99.5
pushd lame-3.100
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
 x86-64)
    HOST= x86-64-linux
  ;;

esac

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$HOST" \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" \
  --enable-arm-neon="$ARM_NEON" \
  --disable-shared || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

popd
