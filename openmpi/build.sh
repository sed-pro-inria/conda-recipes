# For CFLAGS=-fgnu89-inline, see:
# http://lifecs.likai.org/2009/06/multiple-definition-of-extern-inline.html

# ln -s $PREFIX/lib $PREFIX/lib64
# CFLAGS=-fgnu89-inline

if [ "$(uname)" == "Darwin" ];
then
    export MACOSX_DEPLOYMENT_TARGET=10.7
    export CC=clang
    export CXX=clang++
    export CFLAGS="-mmacosx-version-min=10.7"
    export CXXFLAGS="-stdlib=libc++ -mmacosx-version-min=10.7"
fi

./configure \
    --prefix=$PREFIX \
    --disable-dependency-tracking \
    --enable-mpi-fortran \
    --enable-mpi-cxx \
    --enable-shared=yes \
    --enable-static=yes

make -j $CPU_COUNT 

make install
