cp $RECIPE_DIR/SLmake.inc .
CONDADIR=$PREFIX make
cp libscalapack.a $PREFIX/lib
