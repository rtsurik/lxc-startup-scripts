#!/bin/bash

THIS_PATH=$(dirname $0)
. ${THIS_PATH}/lxc-scripts.config

CFGS_PATH="${BASE_PATH}/configs"

for LXC_NAME in $(cat ${BASE_PATH}/containers.list) ; do
    echo "Starting up LXC container $LXC_NAME..."
    LXC_CFG="${CFGS_PATH}/${LXC_NAME}.conf"
    lxc-start -n ${LXC_NAME} -f ${LXC_CFG} -d -q
done
