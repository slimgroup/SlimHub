#!/bin/bash

hname=slimhub
nuser=2

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -h|--hubname)
      hname="$2"
      shift # past argument
      shift # past value
      ;;
    -n|--nuser)
      nuser="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      shift # past argument
      shift # past value
      ;;
  esac
done

rname=${hname}RG
let "mem = 32 + $nuser * 6 / 10"

echo "Starting a JupyterHub $hname for $nuser users with $mem Gb of disk space"

# Creates an azure vm with the littlest jupytehub for tutorials
# Size is defined based on number odf expected users
# run as `./makevm.sh nusers`

# create separate resource group for easy cleanup

az group create -l eastus -n $rname

az vm create --resource-group $rname \
  --name $hname \
  --size Standard_F8s_v2 \
  --image UbuntuLTS \
  --admin-username slimazure \
  --generate-ssh-keys \
  --location eastus \
  --os-disk-size-gb $mem \
  --custom-data cloud-init.yaml

# Open http and https ports for browser access
az vm open-port \
    --resource-group $rname \
    --name $hname \
    --port 80,443

# create cleanup file
echo "az group delete -n $rname --yes" > cleanup.sh
chmod +x cleanup.sh
