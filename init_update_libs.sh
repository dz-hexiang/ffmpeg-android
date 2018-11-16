#!/bin/bash

echo "============================================"
echo "Updating submodules"
git submodule update --init
echo "============================================"
echo "Updating libpng, expat and fribidi"
rm -rf libpng-*
rm -rf expat-*
rm -rf fribidi-*
rm -rf lame-*

wget -O- https://sourceforge.net/projects/libpng/files/libpng16/older-releases/1.6.21/libpng-1.6.21.tar.gz/download | tar xz
#wget -O- http://downloads.sourceforge.net/project/expat/expat/2.1.0/expat-2.1.0.tar.gz | tar xz
wget -O- https://sourceforge.net/projects/expat/files/expat/2.2.6/expat-2.2.6.tar.bz2/download | tar xj
wget -O- http://ftp.lfs-matrix.net/pub/blfs/conglomeration/fribidi/fribidi-1.0.5.tar.bz2 | tar xj
wget -O- https://sourceforge.net/projects/lame/files/lame/3.100/lame-3.100.tar.gz/download | tar xz
echo "============================================"
