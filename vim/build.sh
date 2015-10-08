CPPFLAGS=-I$PREFIX/include \
LDFLAGS=-L$PREFIX/lib \
./configure \
    --prefix=$PREFIX \
    --enable-pythoninterp=yes \
    --enable-rubyinterp=yes \
    --enable-tclinterp=no \
    --enable-cscope \
    --enable-gui=no

make
make install
