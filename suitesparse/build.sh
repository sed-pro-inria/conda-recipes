export CONDADIR=$PREFIX

# SuiteSparse config file
cp \
    $RECIPE_DIR/SuiteSparse_config_linux.mk \
    ./SuiteSparse_config/SuiteSparse_config.mk

# Don't work
# To use METIS, SuiteSparse need to embbed METIS 4.0.1 (see SuiteSparce/README.txt)
#mkdir metis-4.0
#cd metis-4.0
#wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.1.tar.gz
#tar xvzf metis-4.0.1.tar.gz
#rm metis-4.0.1.tar.gz
#cp $RECIPE_DIR/Makefile.in metis-4.0/
#cd ..

make

mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
make install
