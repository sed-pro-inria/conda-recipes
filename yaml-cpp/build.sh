mkdir build
cd build
cmake \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DBoost_INCLUDE_DIR=$PREFIX/include \
    -DBUILD_SHARED_LIBS=ON \
    ..
make
make install
