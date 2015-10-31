make config \
    prefix=$PREFIX \
    cc=mpicc \
    cxx=mpicxx \
    shared=1 \
    metis_path=$PREFIX

VERBOSE=1 make install
