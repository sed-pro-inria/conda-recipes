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

.. warning::

    When building Python extension, `CFLAGS` or `LDFLAGS` environment
    variables should not be set (see next section).

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

Python extension
-------------------------------------------------------------------

Build tools call the `distutils` standard python module (or the
`python-config` command line tool) to set compiler flags for building python
extensions.

Python (provided by Conda) has been built with an old XCode version, and
`distutils` (or `python-config`) may (see bellow) return the flag:

.. code-block:: bash

    -isysroot /Developer/SDKs/MacOSX10.5.sdk

However, `SDK` are now located in:

.. code-block:: bash

   /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs

If `/Developer/SDKs/MacOSX10.5.sdk` is not found (which is the case for the
`conda-build-oxs-10.9` vagrant box), `distutils` (or `python-config`)
**remove** the `-isysroot` flag **except** if the corresponding environment
variables (`CFLAGS` or `LDFLAGS`) are set.

See the `code <https://github.com/python/cpython/blob/1fe0fd9feb6a4472a9a1b186502eb9c0b2366326/Lib/_osx_support.py#L296>`_ in the `ditutils` module.

`-isysroot` is not required because `MACOSX_DEPLOYMENT_TARGET=10.7` and
`-mmacosx-version-min=10.7` are set, so the better is to not set `CFLAGS`,
`LDFLAGS` (and `CXXFLAGS` for being consistant), and use build tool command
line instead, for example, in `build.sh`:

.. code-block:: bash

    export MACOSX_DEPLOYMENT_TARGET=10.7

    export CC=clang
    export CXX=clang++

    unset CXXFLAGS
    unset CFLAGS
    unset LDFLAGS

    $PYTHON waf configure \
        --prefix=$PREFIX \
        --cflags='-O3 -DNDEBUG -mmacosx-version-min=10.7 -arch x86_64' \
        --cxxflags='-O3 -DNDEBUG -stdlib=libc++ -mmacosx-version-min=10.7 -arch x86_64' \
        --ldflags="-L$PREFIX/lib -O3 -DNDEBUG -stdlib=libc++ -mmacosx-version-min=10.7 -arch x86_64"


Path to conda provided libraries on OSX
-------------------------------------------------------------------

On OS X, path to libraries provided by Conda must be provided with
`-L$PREFIX/lib`.
