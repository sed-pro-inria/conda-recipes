
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE=RELEASE ./ ../openMVG-0.9/src/ \
  -DCMAKE_INSTALL_PREFIX=$PREFIX

make
make install

