# For CFLAGS=-fgnu89-inline, see:
# http://lifecs.likai.org/2009/06/multiple-definition-of-extern-inline.html

ln -s $PREFIX/lib $PREFIX/lib64

./configure \
    --prefix=$PREFIX \
    --disable-dependency-tracking \
    --enable-mpi-fortran \
    --enable-mpi-cxx \
    --enable-shared=yes \
    --enable-static=yes \
    CFLAGS=-fgnu89-inline

make -j $CPU_COUNT

make install


