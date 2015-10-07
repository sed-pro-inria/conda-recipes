./configure \
    CPPFLAGS=-I$PREFIX/include \
    LDFLAGS=-L$PREFIX/lib \
    LIBFFI_CFLAGS="-I$PREFIX/include" \
    LIBFFI_LIBS="-L$PREFIX/lib/ -lffi" \
    --prefix=$PREFIX



make -j$CPU_PROC

make install
