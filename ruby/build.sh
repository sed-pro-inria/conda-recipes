#!/bin/bash

bash configure \
    --prefix=$PREFIX \
    --disable-install-doc \
    --enable-load-relative \
    --with-openssl-dir=$PREFIX \
    --enable-shared
make
make install

