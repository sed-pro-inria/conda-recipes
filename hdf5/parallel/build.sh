#!/bin/bash

./configure \
    --prefix=$PREFIX \
    --with-zlib=$PREFIX \
    --with-ssl \
    --enable-linux-lfs \
    --enable-parallel \
    --enable-shared

make

make install

rm -rf $PREFIX/share/hdf5_examples
