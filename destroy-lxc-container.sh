#!/bin/bash

#BASE_PATH=$(pwd)
BASE_PATH="/home/rustam/Scripts/lxc/lxc-scripts"
CFGS_PATH="${BASE_PATH}/configs"

if [ "$1" = "" ]
then 
  echo "Usage: ./destroy-lxc-container.sh <name>"
  exit 0
fi

# get params from the command line
LXC_NAME=$1

# remove the container configs & remove it from containers.list
#
rm -f $CFGS_PATH/${LXC_NAME}.conf 
rm -f $CFGS_PATH/${LXC_NAME}.fstab 

sed -i  ${BASE_PATH}/containers.list -e "/^${LXC_NAME}$/d;"

echo "Container ${LXC_NAME} deleted."

# end.
#
