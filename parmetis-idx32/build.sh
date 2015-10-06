# See parmetis-4.0.3/Install.txt
# Use:
#    - 64 bits floating point numbers.
#    - 32 bits integer for index.
sed 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' -i metis/include/metis.h

make config shared=1 prefix=$PREFIX
make install
