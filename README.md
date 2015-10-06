# conda-recipes
Conda recipes

Libraries make use of 32 bits index integers and 64 bits floating point numbers.

Note:

recipes (except for PETSc) for fenics and its dependencies are copied from:

    https://github.com/Juanlu001/fenics-recipes

## `openblas`

openblas is provided by continuum analytics.

The package `openblas-0.2.14-3` has the file `include/openblas_config.h`. This
file does not defined `OPENBLAS_USE64BITINT`, so `blasint` is a int (32 bits).

## `metis` and `parmetis`

Configured with: longindex=0 and doubleprecision=1

## `superlu_dist`

In `make.inc`, `-D_LONGINT` is commented.

The file `SuperLU_DIST_4.0/README` says:

    This "alpha" release contains double-precision real and double-precision
    complex data types.

Warning: if building `superlu_dist` with 64 bits integer using `-D_LONGINT`,
code that include `superlu_dist` header must be compiled with `-D_LONGINT` in
order to then link the library.

## `mumps`

The library is build for the four flaoting point arithmetics: s, c, d, z.

The file `include/mumps_c_types.h` define 32 bits int:
  
    #define MUMPS_INT int

## `scalapack`

## `petsc`
