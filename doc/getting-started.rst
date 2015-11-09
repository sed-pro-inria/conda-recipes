Getting started
===================================================================


Prerequisite on GNU/Linux
-------------------------------------------------------------------

Install `gcc`, `g++`, and `gfortran`. For example, using `apt-get`:

.. code-block:: bash

    sudo apt-get install gcc g++ gfortran

or using `yum`:

.. code-block:: bash

    yum install gcc-c++ gcc-gfortran


Prerequisite on OSX
-------------------------------------------------------------------

Install `Xcode Command Line Tools`.

Download `gfortran` (select the `gfortran-X.X-bin.tar.gz` package) from
`HPC Mac OS X`_, and install it:

.. code-block:: bash

    sudo tar xvzf gfortran-X.X-bin.tar.gz -C /


Conda installation
-------------------------------------------------------------------

Download the Conda `installer`_, and install `conda`:

On `GNU/Linux` 64 bits:

.. code-block:: bash

    wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
    bash Miniconda-latest-Linux-x86_64.sh

or, on `OSX`:

.. code-block:: bash

    curl -O https://repo.continuum.io/miniconda/Miniconda-latest-MacOSX-x86_64.sh
    bash Miniconda-latest-MacOSX-x86_64.sh

You will be asked for a place to install `miniconda`. Either choose the default
`$HOME/miniconda` or a custom place, for example `/local/<user>/miniconda`.

At the end of the installation, you will be asked for modifying your `Bash`
configuration file (`~/.bashrc` on GNU/Linux, or `~/.bash_profile on OSX`): answer
yes. To take this modification into account, either open a new terminal, or
update the one you are using with: 

.. code-block:: bash

    source ~/.bashrc       # on GNU/Linux
    source ~/.bash_profile # on OSX

.. note:: the `Conda cheat sheet`_ is a usefull ressource to get started with Conda,
          (managing environments for example is worth to learn).


Installing packages
-------------------------------------------------------------------

Install a package provided by the The INRIA Paris-Rocquencourt SED `Conda
channel`_ , for example:

.. code-block:: bash

    conda install -c inria-pro-sed petsc

Your may also want to add the inria-pro-sed Conda channel to your configuration
(this modify your `~/.condarc`):

.. code-block:: bash

   conda config --add channels inria-pro-sed

in order to omit the `-c` option:

.. code-block:: bash

    conda install petsc

.. _installer: http://conda.pydata.org/miniconda.html
.. _Conda channel: http://anaconda.org/sed-pro-inria
.. _Conda: http://conda.pydata.org/docs
.. _`HPC Mac OS X`: http://hpc.sourceforge.net/
.. _`Conda cheat sheet`: http://conda.pydata.org/docs/_downloads/conda-cheatsheet.pdf
