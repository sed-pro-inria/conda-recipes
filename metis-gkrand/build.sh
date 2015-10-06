# See metis-5.1.0/Install.txt
# Use:
#    - 64 bits floating point numbers.
#    - 64 bits integer for index.
sed -i.bak 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' include/metis.h
sed -i.bak 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' include/metis.h

make config \
    prefix=$PREFIX \
    shared=1 \
    gkrand=1
make install
