###################################################################
INRIA Paris-Rocquencourt SED Conda Channel
###################################################################

The `INRIA Paris-Rocquencourt
<http://www.inria.fr/en/centre/paris-rocquencourt>`_ SED `Conda channel`_ aims
at easily distributing scientific software and libraries using the `Conda`_
package manager.

Supported platforms are GNU/Linux 64 bits (old system like Cent OS 5 are not
supported) and OSX from 10.7 to 10.11. Windows is not supported yet (no plan
to support it for now).

Root privileges are not required, except for installing compilers in the
system.

`Conda recipes`_ are available.


*******************************************************************
User documentation
*******************************************************************


.. toctree::
   :maxdepth: 2

   getting-started
   package-listing
   package-details
   package-linking


*******************************************************************
Packager documentation
*******************************************************************


.. toctree::
   :maxdepth: 2

   package-building
   package-testing
   documenting

.. _Conda channel: http://anaconda.org/sed-pro-inria
.. _Conda: http://conda.pydata.org/docs
.. _Conda recipes: https://github.com/sed-pro-inria/conda-recipes
