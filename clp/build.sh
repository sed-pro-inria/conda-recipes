
./configure -C \
    --prefix=$PREFIX \

make -j $CPU_COUNT V=1

make install
