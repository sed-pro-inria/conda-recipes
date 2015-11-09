Linking with packages
===================================================================

Finding path to conda environment
----------------------------------

The `$CONDA_ENV_PATH` environment variable is defined when an environment is
activated.

If no environment is activate, the default environment is used, but 
`$CONDA_ENV_PATH` is not defined.

A way to compute Conda environment path is:

.. code-block:: bash

    CONDA_ENV_PATH = $(conda info -e | grep '*' | tr -s ' ' | cut -d' ' -f3)

Environment variables
----------------------------------

.. warning:: Beware of using environment variables like `LD_LIBRARY_PATH` or
             `DYLD_LIBRARY_PATH`.  They are not required by conda packages,
             and wrong values can lead to errors.

Compilers
----------------------------------

Or `GNU/Linux`, use `gcc`, `g++` or `gfortran` compiler.

On `OSX`, use `clang`, `clang++` or `gfortran` compiler.

.. warning:: Depending on your OSX version, `gcc` is or is **not** an alias
             to `clang`.

C++ standard library
----------------------------------

.. warning:: On OSX, always **build** and **link** with the 
             **-stdlib=libc++** flags, see :ref:`cxxlib`.

Header and library path
-----------------------

When compiling, provided path to header and library paths as usual:

.. code-block:: bash

    <compiler> -L$CONDA_ENV_PATH/lib -I$CONDA_ENV_PATH/include  

When linking on `OSX` (not required for `GNU/Linux`, also set the `rpath`:

.. code-block:: bash

    <compiler> -L$CONDA_ENV_PATH/lib -Wl,-rpath,$CONDA_ENV_PATH/lib

.. note:: When using `mpicc` or `mpic++`, `-L` and `-I` flags are automatically set.
