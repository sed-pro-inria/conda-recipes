#!/bin/bash
set -o errexit
set -o pipefail

if [ "$(uname)" == "Darwin" ];
then
    export CC=clang
    export CXX=clang

    export CFLAGS='-arch x86_64'
    export CXXFLAGS='-arch x86_64'

    export LDFLAGS="-arch x86_64 -L$PREFIX/lib"
fi

python setup.py build --mpicc=$PREFIX/bin/mpicc
python setup.py install --prefix=$PREFIX
