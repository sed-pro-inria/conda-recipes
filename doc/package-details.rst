Package details
===================================================================

Integer and real types
-------------------------------------------------------------------

Numerical algebra libraries make use of **32 bits index integers** and **64 bits
floating point** numbers.

.. note:: OpenBLAS is provided by continuum analytics.  The package
          `openblas-0.2.14-3` contains the file `include/openblas_config.h`. This file
          does not defined `OPENBLAS_USE64BITINT`, so `blasint` is a int (32 bits).

.. _cxxlib:

C++ standard library on OSX
-------------------------------------------------------------------

On OSX, two implementations of the `C++` standard library are available:

   - The `GNU` implementation: `libstdc++.dylib`
   - The `Clang` implementation: `libc++.dylib`

The `ABI` of these two libraries are incompatibles.

All packages in the INRIA Paris-Rocquencourt SED Conda channel are built with the
`Clang` implementation.

.. note:: A Python script (for example), may import a C++ extension linked with 
          `libc++.dylib` and another C++ extension linked with `libstdc++.dylib`
          without problems, as long as the two extensions do not directly
          exchange C++ data structures.

glibc and gcc versions
-------------------------------------------------------------------

Packages are build on `Centos 6.6`, using `glibc` version `2.12`, and `gcc`
version `4.4.7`. As a consequence, packages will work on all `GNU/Linux` distribution
providing `glibc` version `2.12` or greater.

Taken from `distrowatch <http://distrowatch.com>`_, here are some examples:

+--------------+--------+-------+
| distribution | glibc  | gcc   |
+==============+========+=======+
| centos 5.11  | 2.5    | 4.1.2 |
+--------------+--------+-------+
| centos 6.6   | 2.12   | 4.4.7 |
+--------------+--------+-------+
| centos 7.0   | 2.17   | 4.8.3 |
+--------------+--------+-------+
| ubuntu 12.04 | 2.15   | 4.6.3 |
+--------------+--------+-------+
| ubuntu 14.04 | 2.19   | 4.8.2 |
+--------------+--------+-------+
| debian 7     | 2.13   | 4.7.2 |
+--------------+--------+-------+
| fedora 17    | 2.15   | 4.7.0 |
+--------------+--------+-------+
| suse 12.1    | 2.12.1 | 4.6.2 |
+--------------+--------+-------+

Instead of using the system `gcc`, we may in the future use the `gcc` conda
package, which provide a recent `gcc` version, linked with an old `glibc`
version.  But currently (5 October, 2015), `gcc` Conda package (4.8.5-3, in asmeurer
channel), has too much problems:

  - https://groups.google.com/a/continuum.io/forum/#!search/froger/conda/Lb_Vnz6O85s/20dsvlvlBwAJ
  - https://github.com/conda/conda-recipes/issues/435
  - https://github.com/conda/conda-recipes/issues/431

Build environment
-------------------------------------------------------------------

Packages are built on Vagrant box, and hosted on `anaconda
<http://anaconda.org/inria-pro-sed>`_ in channels tagged with the box name and
version.
