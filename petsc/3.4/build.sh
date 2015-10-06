export PETSC_DIR=$PWD
export PETSC_ARCH=linux-64-release

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

make all

make install

# todo: mpi4py, petsc4py fiat, fftw, boost, suitesparse
