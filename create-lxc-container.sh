#!/bin/bash

THIS_PATH=$(dirname $0)
. ${THIS_PATH}/lxc-scripts.config

CFGS_PATH="${BASE_PATH}/configs"

if [ "$2" = "" ]
then 
  echo "Usage: ./create-lxc-container.sh <name> <path>"
  exit 0
fi

# get params from the command line
LXC_NAME=$1
LXC_PATH=$2

# delete a trailing slash from the path
#
LXC_PATH=$(echo "${LXC_PATH}" |sed "s/\/$//")

# generate 4 pseudo-random numbers for the MAC address
HW1=$(($RANDOM % 10)); HW2=$(($RANDOM % 10))
HW3=$(($RANDOM % 10)); HW4=$(($RANDOM % 10))

# create an LXC container config
#
cat > $CFGS_PATH/${LXC_NAME}.conf <<LxcContainerConfig
lxc.utsname = ${LXC_NAME}

lxc.mount = ${CFGS_PATH}/${LXC_NAME}.fstab
lxc.rootfs = ${LXC_PATH}/

lxc.network.type = veth
;lxc.network.flags = up
lxc.network.link = br0
lxc.network.hwaddr = 02:00:00:00:${HW1}${HW2}:${HW3}${HW4}
;lxc.network.ipv4 = 192.168.1.190
lxc.network.name = eth0

lxc.tty = 4
LxcContainerConfig

# create an LXC container fstab
#
cat > $CFGS_PATH/${LXC_NAME}.fstab <<LxcContainerFstab
none ${LXC_PATH}/dev/pts devpts defaults 0 0
none ${LXC_PATH}/proc    proc   defaults 0 0
none ${LXC_PATH}/sys     sysfs  defaults 0 0
#none ${LXC_PATH}/dev/shm tmpfs  defaults 0 0
LxcContainerFstab

# add the container to containers.list
#
IS_THERE=$(grep "^${LXC_NAME}$" ${BASE_PATH}/containers.list)
if [ "${IS_THERE}" = "" ]
then
    echo "Container ${LXC_NAME} created."
    echo ${LXC_NAME} >> ${BASE_PATH}/containers.list
else
    echo "Container exists, configs overwritten."
fi

# end.
#
