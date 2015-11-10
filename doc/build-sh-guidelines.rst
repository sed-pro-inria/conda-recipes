`build.sh` guidelines.
===================================================================

Building packages is documented in the 
`Conda documentation <http://conda.pydata.org/docs/building/build.html>`_.

`Conda recipes <https://github.com/sed-pro-inria/conda-recipes>`_ are available
on GitHub.

Shared libraries
-------------------------------------------------------------------

Build shared libraries when possible (requires `-fPIC` flag).

If building a static library, use the `-fPIC` flag too: the static library may
be used latter in a dynamic library.

Plateform conditional code
-------------------------------------------------------------------

If different logic must be performed on `GNU/Linux` and `OSX`, use the
construct:

.. code-block:: bash

    if [ "$(uname)" == "Darwin" ]
    then
        # OSX recipe
    else
        # GNU/Linux recipe
    fi

Verbose build
-------------------------------------------------------------------

Prefer verbose build, to facilitate debugging.

For example with `autotools`:

.. code-block:: bash

    make V=1

or with `CMake`:

.. code-block:: bash

    VERBOSE=1 make

clang and libc++.dylib
-------------------------------------------------------------------

When building `C` code on `OSX`: 
  * use `clang` or `mpicc`
  * `MACOSX_DEPLOYMENT_TARGET` is already automatically set to `10.6` by `conda-build`.

When building `C++` code on `OSX`:
  * Use `clang++` or `mpicxx`.
  * Build for 10.7 and upper.
  * Link with `libc++.dylib`

For example, for typical `autotools` based software:

.. code-block:: bash

    export MACOSX_DEPLOYMENT_TARGET=10.7

    export CC=clang
    export CXX=clang++
    export CFLAGS="-mmacosx-version-min=10.7"
    export CXXFLAGS="-stdlib=libc++ -mmacosx-version-min=10.7"
    export LDFLAGS="-stdlib=libc++ -mmacosx-version-min=10.7"

    ./configure --prefix=$PREFIX
    make V=1

or for `CMake` based software:

.. code-block:: bash

    export MACOSX_DEPLOYMENT_TARGET=10.7

    VERBOSE=1 cmake \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_C_FLAGS="-mmacosx-version-min=10.7" \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_FLAGS="-stdlib=libc++ -mmacosx-version-min=10.7" \
        -DCMAKE_SHARED_LINKER_FLAGS="-stdlib=libc++ -mmacosx-version-min=10.7" \
        -DCMAKE_EXE_LINKER_FLAGS="-stdlib=libc++ -mmacosx-version-min=10.7" \
        -DCMAKE_INSTALL_PREFIX=$PREFIX \
        ..
