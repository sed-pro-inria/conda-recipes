export MACOSX_DEPLOYMENT_TARGET=10.7

mkdir build
cd build

if [ "$(uname)" == "Darwin" ];
then
    VERBOSE=1 cmake \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_C_FLAGS="-mmacosx-version-min=10.7" \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_FLAGS="-stdlib=libc++ -mmacosx-version-min=10.7" \
        -DCMAKE_SHARED_LINKER_FLAGS="-stdlib=libc++ -mmacosx-version-min=10.7" \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DBoost_INCLUDE_DIR=$PREFIX/include \
        -DBUILD_SHARED_LIBS=ON \
        ..
else
    VERBOSE=1 cmake \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        -DBoost_INCLUDE_DIR=$PREFIX/include \
        -DBUILD_SHARED_LIBS=ON \
        ..
fi

make
make install
