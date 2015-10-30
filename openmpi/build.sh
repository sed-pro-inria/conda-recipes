# For CFLAGS=-fgnu89-inline, see:
# http://lifecs.likai.org/2009/06/multiple-definition-of-extern-inline.html

# ln -s $PREFIX/lib $PREFIX/lib64
# CFLAGS=-fgnu89-inline

LDFLAGS="-Wl,-headerpad_max_install_names" \
./configure \
    --prefix=$PREFIX \
    --disable-dependency-tracking \
    --enable-mpi-fortran \
    --enable-mpi-cxx \
    --enable-shared=yes \
    --enable-static=yes

make -j $CPU_COUNT

make install

##############################################################################
# Replace references to libraries in /usr/local/lib with references to
# libaries in libgcc conda package.
##############################################################################

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
mpilib_filenames=" \
    libmpi_usempi_ignore_tkr.0.dylib \
    libmpi_usempi_ignore_tkr.dylib \
    libmpi_usempif08.0.dylib \
    libmpi_usempif08.dylib"

# Perform the replacement.
for filename in $mpilib_filenames
do
    for dependance in $libgcc_pkg_libs
    do
        old_path=/usr/local/lib/$dependance
        new_path=$PREFIX/lib/$dependance
        filepath=$PREFIX/lib/$filename
        install_name_tool -change $old_path $new_path $filepath
    done
done
