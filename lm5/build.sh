if [ "$(uname)" == "Darwin" ];
then
    EXT=dylib
else
    EXT=so
fi

gcc \
    -I. -fno-common -fPIC -shared \
    -o libmesh5.$EXT \
    libmesh5.c

mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include

cp libmesh5.$EXT $PREFIX/lib
cp libmesh5.h $PREFIX/include
