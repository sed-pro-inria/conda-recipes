chmod +x ./configure
./configure \
  --prefix=$PREFIX

make -j $CPU_COUNT V=1

make install
