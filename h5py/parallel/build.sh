#!/bin/bash

# http://docs.h5py.org/en/latest/mpi.html#building-against-parallel-hdf5

export CC=mpicc
export HDF5_DIR=$PREFIX

$PYTHON setup.py configure --mpi --hdf5=$PREFIX
$PYTHON setup.py build
$PYTHON setup.py install
