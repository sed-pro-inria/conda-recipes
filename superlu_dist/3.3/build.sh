cp $RECIPE_DIR/make.inc .
CONDADIR=$PREFIX make
cp SRC/*.h $PREFIX/include

