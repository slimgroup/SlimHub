# JupyterHub setup for slim tutorials

This set of script sets up a jupyterhub on azure with both julia and python setup.

This repository contains two script:

- `cloud_init` generates the yaml file for the VM configuration (jupyterhub, julia, ..)
- `setup_slimhub` creates the vm. This one takes two arguments:
    - `h/--hname` the name of the server
    - `m/--nuser` the number of expected users. This number is only used for disk space currently.

There is a `configs` directory with configuration files. These files are bash script that install any required library for all users.
You can add additional script to this directory if you wish to install additional software and backage. There is currently two configuration files:

- `setup_2_jl`. This one  is a bit messy but is necessary to have julia installed and usaable for all users on the server
- `setup_1_py`. This one is fairly simple and only installs devito and put the jupyter notebook tutorials into the users workspace.

**NOTE 1**: 
JupyterHub is as multi-user server. Standard package installs may not make it available to users, check the documentation at [jupyterhub] to figure out how the `PATH` should be setup to make software available to all users.

**NOTE 2**:
The config script are read in alphabetical order, rename all script accordinglyy if you know some dependencies hould be installed in a particular order. For example, currently python needs to be setup first with matplotlib so that PyPlot can be installed properly in the julia setup. So the names are made to have python installed first.