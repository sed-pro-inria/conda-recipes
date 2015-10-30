# For CFLAGS=-fgnu89-inline, see:
# http://lifecs.likai.org/2009/06/multiple-definition-of-extern-inline.html

# ln -s $PREFIX/lib $PREFIX/lib64
# CFLAGS=-fgnu89-inline

./configure \
    --prefix=$PREFIX \
    --disable-dependency-tracking \
    --enable-mpi-fortran \
    --enable-mpi-cxx \
    --enable-shared=yes \
    --enable-static=yes

make -j $CPU_COUNT

make install


