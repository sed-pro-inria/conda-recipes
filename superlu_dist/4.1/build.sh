cp $RECIPE_DIR/make.inc.`uname` ./make.inc
CONDADIR=$PREFIX make
cp SRC/*.h $PREFIX/include

