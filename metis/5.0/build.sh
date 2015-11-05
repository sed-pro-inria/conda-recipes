if [ "$(uname)" == "Darwin" ];
then
    make config \
        cc=clang \
        prefix=$PREFIX \
        shared=1 \
        longindex=0 \
        doubleprecision=1
else
    make config \
        prefix=$PREFIX \
        shared=1 \
        longindex=0 \
        doubleprecision=1
fi

make install
