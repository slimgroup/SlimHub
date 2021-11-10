# JupyterHub setup for slim tutorials

This basically is the sctipt to creat an jupyterhub sever on azure following his [wiki](https://github.com/devitocodes/devito/wiki/How-to-setup-a-JupyterHub-server-on-Azure-for-using-Devito-in-a-classroom-environment)

The user needs to have the `azure-cli` install and credentials setup (`az login`)

This should be run as `./makevm nuser` where `nuser` is the number of expected users so that there is enugh disk space allocated.


This can be used for tutorial or classes as well since it provides a set environment with our software installed. 
