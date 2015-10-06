# See metis-5.1.0/Install.txt
sed -i.bak 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' include/metis.h

make config \
    prefix=$PREFIX \
    shared=1 \
    gkrand=1
make install
