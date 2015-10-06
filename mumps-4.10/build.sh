cp $RECIPE_DIR/Makefile.gfortran.PAR Makefile.inc
CONDADIR=$PREFIX make all
cp lib/*.a $PREFIX/lib
cp include/*.h $PREFIX/include
