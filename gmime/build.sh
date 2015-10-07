ln -s $PREFIX/lib $PREFIX/lib64

./configure \
    CPPFLAGS=-I$PREFIX/include \
    LDFLAGS=-L$PREFIX/lib \
    --prefix=$PREFIX

make -j $CPU_PROC

make install
