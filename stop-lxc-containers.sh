#!/bin/bash

#BASE_PATH=$(pwd)
BASE_PATH="/home/rustam/Scripts/lxc/lxc-scripts"
CFGS_PATH="${BASE_PATH}/configs"

for LXC_NAME in `cat ${BASE_PATH}/containers.list` ; do
    echo "Stopping LXC container $LXC_NAME..."
    lxc-stop -n ${LXC_NAME}
done
