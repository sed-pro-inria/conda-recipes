gcc \
    -I. -fno-common -fPIC -shared \
    -o libmesh5.so \
    libmesh5.c

mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include

cp libmesh5.so $PREFIX/lib
cp libmesh5.h $PREFIX/include
