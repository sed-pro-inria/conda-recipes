export PETSC_DIR=$PWD
export PETSC_ARCH=linux-64-release

if [ "$(uname)" == "Darwin" ];
then
    python config/configure.py \
        --prefix=$PREFIX \
        --with-shared-libraries \
        --with-mpi-dir=$PREFIX \
        --with-metis-dir=$PREFIX \
        --with-scalapack-dir=$PREFIX \
        --with-parmetis-dir=$PREFIX \
        --with-mumps-dir=$PREFIX \
        --with-superlu_dist-dir=$PREFIX \
        --LDFLAGS="-Wl,-rpath,$PREFIX/lib"
else
    python config/configure.py \
        --prefix=$PREFIX \
        --with-shared-libraries \
        --with-blas-lapack-lib=openblas \
        --with-mpi-dir=$PREFIX \
        --with-metis-dir=$PREFIX \
        --with-scalapack-dir=$PREFIX \
        --with-parmetis-dir=$PREFIX \
        --with-mumps-dir=$PREFIX \
        --with-superlu_dist-dir=$PREFIX
fi

make all

make install

# todo: mpi4py, petsc4py fiat, fftw, boost, suitesparse
