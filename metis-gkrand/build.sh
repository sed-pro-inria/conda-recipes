# See metis-5.1.0/Install.txt

long_bit=$(getconf LONG_BIT)

if [ "$long_bit" == "32" ]
then
    echo "Configure metis for 32 bit architecture"
elif [ "$long_bit" == "64" ]
then
    echo "Configure metis for 64 bit architecture"
    sed -i.bak 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' include/metis.h
    sed -i.bak 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' include/metis.h
else
    echo "Expected 'getconfig LONG_BIT' to be 32 or 64, but got $long_bit"
    exit 1
fi

make config \
    prefix=$PREFIX \
    shared=1 \
    gkrand=1
make install
