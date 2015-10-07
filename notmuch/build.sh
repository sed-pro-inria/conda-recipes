PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig \
./configure \
    --prefix=$PREFIX

make -j $CPU_PROC

make install

cd bindings/python
pip install .

cd ../../bindings/ruby
ruby extconf.rb
make
make install
