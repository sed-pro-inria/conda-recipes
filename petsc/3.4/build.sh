# todo: mpi4py, petsc4py fiat, fftw, boost, suitesparse

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

    make all
    make install

    ##########################################################################
    # Replace references to libraries in /usr/local/lib with references to
    # libaries in libgcc conda package.
    ##########################################################################

    # Libraries provided by libgcc 4.8.5.1 conda package.
    libgcc_pkg_libs=" \
        libgcc_s.1.dylib \
        libgomp.dylib \
        libgcc_s_ppc64.1.dylib \
        libquadmath.0.dylib \
        libgcc_s_x86_64.1.dylib \
        libquadmath.dylib \
        libgfortran.3.dylib \
        libstdc++.6.dylib \
        libgfortran.dylib \
        libstdc++.dylib \
        libgomp.1.dylib"

    # Libraries that contains reference to /usr/local/lib
    filenames=libpetsc.dylib

    # Perform the replacement.
    for filename in $filenames
    do
        for dependance in $libgcc_pkg_libs
        do
            old_path=/usr/local/lib/$dependance
            new_path=$PREFIX/lib/$dependance
            filepath=$PREFIX/lib/$filename
            install_name_tool -change $old_path $new_path $filepath
        done
    done
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

    make all
    make install
fi
