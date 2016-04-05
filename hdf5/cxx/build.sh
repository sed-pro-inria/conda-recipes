#!/bin/bash

./configure \
    --prefix=$PREFIX \
    --with-zlib=$PREFIX \
    --with-ssl \
    --enable-linux-lfs \
    --enable-shared \
    --enable-cxx

make

make install

rm -rf $PREFIX/share/hdf5_examples
