Vagrant boxes
===================================================================

Packages are built on Vagrant boxes for reproducibility.

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
    - on the `main,boxname-boxversion` channels.

Build a new box
-------------------------------------------------------------------

Make changes in `Vangrantfile`, `ressources/` or `script/`.

Update `CHANGELOG`.

Update version number in `ressources/_bashrc`.

Between two tagged versions, set the version number to X.X.Xdev in
`ressources/_bashrc`.

Commit and tag:

.. code-block:: bash

    git add ressources/_bashrc # and other files
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
