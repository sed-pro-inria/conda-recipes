make config \
    prefix=$PREFIX \
    cc=mpicc \
    shared=1 \
    metis_path=$PREFIX

VERBOSE=1 make install
