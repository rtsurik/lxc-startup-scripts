#!/bin/bash

THIS_PATH=$(dirname $0)
. ${THIS_PATH}/lxc-scripts.config

CFGS_PATH="${BASE_PATH}/configs"

for LXC_NAME in `cat ${BASE_PATH}/containers.list` ; do
    echo "Stopping LXC container $LXC_NAME..."
    lxc-stop -n ${LXC_NAME}
done
