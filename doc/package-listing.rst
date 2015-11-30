Package listing
===================================================================

Linear algebra libraries
-------------------------------------------------------------------

Available libraries are:

.. list-table:: 
   :widths: 10 30 10
   :header-rows: 1

   * - Package
     - Description
     - Links

   * - `METIS <http://glaros.dtc.umn.edu/gkhome/metis/metis/overview>`_
     - Serial Graph Partitioning and Fill-reducing Matrix Ordering
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/metis>`__,
       `packages <http://anaconda.org/inria-pro-sed/metis/files>`__

   * - `Mumps <http://mumps.enseeiht.fr>`_
     - A parallel sparse direct solver
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/mumps>`__,
       `packages <http://anaconda.org/inria-pro-sed/mumps/files>`__

   * - `Open MPI <http://www.open-mpi.org/>`_
     - Open MPI: A high performance message passing library
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/openmpi>`__,
       `packages <http://anaconda.org/inria-pro-sed/openmpi/files>`__

   * - `ParMETIS <http://glaros.dtc.umn.edu/gkhome/metis/parmetis/overview>`_
     - ParMETIS is an MPI-based parallel library that implements a variety of
       algorithms for partitioning unstructured graphs, meshes, and for computing
       fill-reducing orderings of sparse matrices.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/parmetis>`__,
       `packages <http://anaconda.org/inria-pro-sed/parmetis/files>`__

   * - `PETSc <http://www.mcs.anl.gov/petsc>`_
     - PETSc: Portable, Extensible Toolkit for Scientific Computation
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/petsc>`__,
       `packages <http://anaconda.org/inria-pro-sed/petsc/files>`__

   * - `ScaLAPACK <http://www.netlib.org/scalapack>`_
     - ScaLAPACK is a library of high-performance linear algebra routines
       for parallel distributed memory machines. 
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/scalapack>`__,
       `packages <http://anaconda.org/inria-pro-sed/scalapack/files>`__

   * - `SuperLU_DIST <http://crd-legacy.lbl.gov/~xiaoye/SuperLU/>`_
     - SuperLU is a general purpose library for the direct solution of large,
       sparse, nonsymmetric systems of linear equations on high performance machines.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/superlu_dist>`__,
       `packages <http://anaconda.org/inria-pro-sed/superlu_dist/files>`__

.. note::

    * `Open MPI` is build with `C`, `C++` and `Fortran` API.

Relationships between main libraries are (blue indicate package provided by
`continuum.io <https://repo.continuum.io/pkgs/>`_).

.. digraph:: petsc

    PETSc -> Mumps
    PETSc -> SuperLU_DIST
    Mumps -> ScaLAPACK
    Mumps -> ParMETIS
    ScaLAPACK -> OpenBLAS
    ScaLAPACK -> OpenMPI
    SuperLU_DIST -> OpenBLAS
    SuperLU_DIST -> ParMETIS
    ParMETIS -> METIS
    ParMETIS -> OpenMPI

    OpenBLAS [color=blue]

.. digraph:: dolfin
 
    dolfin -> boost
    dolfin -> qt
    dolfin -> vtk
    dolfin -> Eigen3
    dolfin -> ffc
    dolfin -> ply
    dolfin -> OpenMPI
    ffc -> ufl
    ffc -> fiat
    ffc -> instant
    ufl -> six
    fiat -> numpy
    fiat -> sympy
    instant -> SWIG
    instant -> numpy
    instant -> CMake

    qt [color=blue]
    boost [color=blue]
    numpy [color=blue]
    vtk [color=blue]
    six [color=blue]
    SWIG [color=blue]
    ply [color=blue]
    sympy [color=blue]
    CMake [color=blue]

Software engineering tools
-------------------------------------------------------------------

Available tools:

.. list-table:: 
   :widths: 10 30 10
   :header-rows: 1

   * - Package
     - Description
     - Links

   * - `buildbot-master <http://buildbot.net/>`_
     - Buildbot is an open-source framework for automating 
       software build, test, and release processes.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/buildbot-master>`__,
       `packages <http://anaconda.org/inria-pro-sed/buildbot-master/files>`__

   * - `buildbot-slave <http://buildbot.net/>`_
     - Buildbot is an open-source framework for automating software build, test, and release processes.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/buildbot-slave>`__,
       `packages <http://anaconda.org/inria-pro-sed/buildbot-slave/files>`__

   * - `klink <http://pmorissette.github.io/klink/>`_
     - A Simple and Clean Sphinx Docs Theme
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/klink>`__,
       `packages <http://anaconda.org/inria-pro-sed/klink/files>`__

   * - `nbtools <https://github.com/thni/nbtools>`_
     -  Tools for managing IPython notebooks
     - `recipe <https://github.com/thni/nbtools/tree/master/conda-recipe>`__,
       `packages <http://anaconda.org/inria-pro-sed/nbtools/files>`__


Relationships between main libraries are (blue indicate package provided by
`continuum.io <https://repo.continuum.io/pkgs/>`_).

.. digraph:: "buildbot-master"

    "Buildbot Master" -> "python2.7"
    "Buildbot Master" -> Twisted
    "Buildbot Master" -> Jinja2
    "Buildbot Master" -> SQLAlchemy
    "Buildbot Master" -> dateutil
    "Buildbot Master" -> "SQLAlchemy Migrate"
    "SQLAlchemy Migrate" -> SQLAlchemy
    "SQLAlchemy Migrate" -> Decorator
    "SQLAlchemy Migrate" -> Tempita

    "python2.7" [color=blue]
    Twisted [color=blue]
    Jinja2 [color=blue]
    SQLAlchemy [color=blue]
    dateutil [color=blue]
    Decorator [color=blue]
    
.. digraph:: nbtools

   nbtools -> Python
   nbtools -> Jinja2
   nbtools -> "IPython Notebook"
   nbtools -> matplotlib
   nbtools -> nose
   nbtools -> ghdiff
   ghdiff -> chardet 

    Python [color=blue]
    Jinja2 [color=blue]
    matplotlib [color=blue]
    nose [color=blue]
    "IPython Notebook" [color=blue]

File format libraries
-------------------------------------------------------------------

Available libraries:

.. list-table:: 
   :widths: 10 30 10
   :header-rows: 1

   * - Package
     - Description
     - Links

   * - `GetPot <http://getpot.sourceforge.net/>`_
     - Powerful Input File and Command Line Parser
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/getpot>`__,
       `packages <http://anaconda.org/inria-pro-sed/getpot/files>`__

   * - `h5utils <http://ab-initio.mit.edu/wiki/index.php/H5utils>`_
     - h5utils is a set of utilities for visualization and conversion of scientific data
       in the free, portable HDF5 format. 
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/h5utils-cxx>`__,
       `packages <http://anaconda.org/inria-pro-sed/h5utils-cxx/files>`__

   * - `HDF5 <http://www.hdfgroup.org/HDF5/>`_
     - HDF5 is a data model, library, and file format for storing and managing data.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/hdf5-cxx>`__,
       `packages <http://anaconda.org/inria-pro-sed/hdf5-cxx/files>`__

   * - `LM5 <https://www.rocq.inria.fr/gamma/gamma/Membres/CIPD/Loic.Marechal/Research/LM6.html>`_
     - Reads and writes mesh files (.mesh) or physical solution files (.sol)
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/lm5>`__,
       `packages <http://anaconda.org/inria-pro-sed/lm5/files>`__

   * - `yaml-cpp <https://code.google.com/p/yaml-cpp/>`_
     - A YAML parser and emitter in C++
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/yaml-cpp>`__,
       `packages <http://anaconda.org/inria-pro-sed/yaml-cpp/files>`__

.. note::

    * `HDF5` is build with `C` and `C++` API.

Python bindings
-------------------------------------------------------------------

Available Python bindings are:

.. list-table:: 
   :widths: 10 30 10
   :header-rows: 1

   * - Package
     - Description
     - Links

   * - `h5py <http://www.h5py.org/>`_
     - The h5py package is a Pythonic interface to the HDF5 binary data format.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/h5py-cxx>`__,
       `packages <http://anaconda.org/inria-pro-sed/h5py-cxx/files>`__

   * - `mpi4py <https://bitbucket.org/mpi4py/mpi4py/>`_
     - This package provides Python bindings for the Message Passing Interface (MPI) standard.
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/mpi4py>`__,
       `packages <http://anaconda.org/inria-pro-sed/mpi4py/files>`__

   * - `petsc4py </>`_
     - PETSc for Python
     - `recipe <https://github.com/sed-pro-inria/conda-recipes/tree/master/petsc4py>`__,
       `packages <http://anaconda.org/inria-pro-sed/petsc4py/files>`__

