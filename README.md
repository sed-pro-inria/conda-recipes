# conda-recipes
Conda recipes

Libraries make use of 32 bits index integers and 64 bits floating point numbers.

## `openblas`

openblas is provided by continuum analytics.

The package `openblas-0.2.14-3` has the file `include/openblas_config.h`. This
file does not defined `OPENBLAS_USE64BITINT`, so `blasint` is a int (32 bits).

## `metis` and `parmetis`

In `build.sh`, `REALTYPEWIDTH` is set to 64, and `IDXTYPEWIDTH` is left to 32.

To build `metis` with 64 bits index integers, we would have use in `build.sh`:

    sed -i.bak 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' include/metis.h

To build `parmetis` with 64 bits index integers, we would have use in `build.sh`:

    sed -i.bak 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' metis/include/metis.h


## `superlu_dist`

In `make.inc`, `-D_LONGINT` is commented.

The file `SuperLU_DIST_4.0/README` says:

    This "alpha" release contains double-precision real and double-precision
    complex data types.

## `mumps`

The library is build for the four flaoting point arithmetics: s, c, d, z.

The file `include/mumps_c_types.h` define 32 bits int:
  
    #define MUMPS_INT int

## `scalapack`

## `petsc`
