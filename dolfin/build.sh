#!/bin/bash

hash -r

mkdir build
cd build

cmake \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBOOST_ROOT=$PREFIX \
    -DBoost_NO_SYSTEM_PATHS=True \
    ..

make install
