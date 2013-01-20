#!/bin/bash

THIS_PATH=$(dirname $0)
. ${THIS_PATH}/lxc-scripts.config

CFGS_PATH="${BASE_PATH}/configs"

if [ "$1" = "" ]
then 
    echo "Usage: ./start-single-container.sh <name>"
    exit 0
fi

LXC_NAME=$1

echo "Starting up LXC container $LXC_NAME..."
LXC_CFG="${CFGS_PATH}/${LXC_NAME}.conf"
lxc-start -n ${LXC_NAME} -f ${LXC_CFG} -d -q
