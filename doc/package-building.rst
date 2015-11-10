Packages building
===================================================================

Building packages is documented in the 
`Conda documentation <http://conda.pydata.org/docs/building/build.html>`_.

`Conda recipes <https://github.com/sed-pro-inria/conda-recipes>`_ are available
on GitHub.

`build.sh` guidelines.
-------------------------------------------------------------------

Build shared libraries when possible (requires `-fPIC` flag).

If building a static library, use the `-fPIC` flag too: the static library may
be used latter in a dynamic library.

If different logic must be performed on `GNU/Linux` and `OSX`, use the
construct:

.. code-block:: bash

    if [ "$(uname)" == "Darwin" ];
    then
        # OSX recipe
    else
        # GNU/Linux recipe
    fi

When building `C` code on `OSX`, use `clang` or `mpicc`.
`MACOSX_DEPLOYMENT_TARGET` is already automatically set to `10.6` by
`conda-build`.

When building `C++` code on `OSX`, use `clang++` or `mpicxx`. Also
use these settings:

.. code-block:: bash

   export MACOSX_DEPLOYMENT_TARGET=10.7
   export CFLAGS="-mmacosx-version-min=10.7"
   export CXXFLAGS="-stdlib=libc++ -mmacosx-version-min=10.7"

Vagrant boxes
-------------------------------------------------------------------

Packages are build and Vagrant boxes for reproducibility.

Make sure to have the most recent version of `VirtualBox
<https://www.virtualbox.org>`_ and `Vagrant <https://www.vagrantup.com>`_.

Vagrant boxes are hosted on `hashicorp
<https://atlas.hashicorp.com/inria-pro-sed>`_.
    
Using vagrant boxes
-------------------------------------------------------------------

This section contains instructions to use `conda-build-centos-6.6` box, the
same apply for `conda-build-centos-7.0` or `conda-build-oxs-10.9` boxes.

Create a directory and initialize the box in it:

.. code-block:: bash

    mkdir -p inria-pro-sed/conda-build-centos-6.6
    cd inria-pro-sed/conda-build-centos-6.6
    vagrant init inria-pro-sed/conda-build-centos-6.6

In the `Vagrantfile`, synchronise your Conda recipe directory:

.. code-block:: ruby

    config.vm.synced_folder "/path/to/repo/sed-pro-inria/conda-recipes",
      "/home/vagrant/repo/sed-pro-inria/conda-recipes"

and increase cpu and memory:

.. code-block:: bash

    # Memory and CPU.
    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 8
    end

Start the machine, and connect to it:

.. code-block:: bash

    vagrant up
    vagrant ssh

Build your Conda package and use the `upload` alias to upload on
`anaconda.org`:

    - on the `inria-pro-sed` user,
    - on the `main,X.X.X` channels.

Build a new box
-------------------------------------------------------------------

Make changes in `Vangrantfile`, `ressources/` or `script/`.

Update `CHANGELOG`.

Update version number in `ressources/_bashrc`.

Between two tagged versions, set the version number to X.X.Xdev in
`vagrant_box_version` file.

Commit and tag:

.. code-block:: bash

    git add ressources/_bashrc
    git commit -m "Bump conda-build-centos-6.6 version number to X.X.X"
    git tag centos-6.6-X.X.X

Destroy old box, and create a new one:

.. code-block:: bash

    vagrant destroy
    vagrant up

Package the box, and add into Vagrant:

.. code-block:: bash

    vagrant package --output conda-build-centos-6.6.box

Upload the box to using the `web interface <https://atlas.hashicorp.com/inria-pro-sed/boxes/conda-build-centos-6.6>`_.
    
Or generate a `token <https://atlas.hashicorp.com/settings/tokens>`_ from ,
store it in `$ATLAS_TOKEN` and use the `API <https://vagrantcloud.com/docs/providers>`_. For example:

.. code-block:: bash

    # TODO: create a provider

    # Upload a box for provider
    curl https://atlas.hashicorp.com/api/v1/box/inria-pro-sed/conda-build-centos-6.6/version/$VAGRANT_BOX_VERSION/provider/virtualbox/upload?access_token=$ATLAS_TOKEN
    UPLOAD_PATH=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX # Use value returned by previous command
    curl -X PUT --upload-file $AGRANT_BOX_NAME.box https://binstore.hashicorp.com/$UPLOAD_PATH # display nothing, just wait...
