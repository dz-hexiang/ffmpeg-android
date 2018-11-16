#!/bin/bash

. abi_settings.sh $1 $2 $3

#pushd expat-2.1.0
pushd expat-2.2.6

make clean


./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="$NDK_TOOLCHAIN_ABI" \
  --enable-static \
  --without-xmlwf \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make -j${NUMBER_OF_CORES} install || exit 1
