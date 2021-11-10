#!/bin/bash

let "mem = 32 + $1 * 6 / 10"
# Creates an azure vm with the littlest jupytehub for tutorials
# Size is defined based on number odf expected users
# run as `./makevm.sh nusers`

az vm create  --resource-group SLIM \
  --name slimhub \
  --size Standard_F8s_v2 \
  --image UbuntuLTS \
  --admin-username slimazure \
  --generate-ssh-keys \
  --location eastus \
  --os-disk-size-gb $mem \
  --custom-data cloud-init.txt
