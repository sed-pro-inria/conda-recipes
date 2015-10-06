# See parmetis-4.0.3/Install.txt
sed 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' -i metis/include/metis.h

make config shared=1 prefix=$PREFIX
make install
