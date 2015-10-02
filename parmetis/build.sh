# See parmetis-4.0.3/Install.txt
sed 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' -i metis/include/metis.h
sed 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' -i metis/include/metis.h

make config shared=1 prefix=$PREFIX
make install
