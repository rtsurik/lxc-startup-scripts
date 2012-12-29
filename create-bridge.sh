#!/bin/bash

BR_NAME="br0"
HOST_IFACE="wlan0"
BR_IP="10.2.1.1"

brctl addbr ${BR_NAME}
ifconfig ${BR_NAME} ${BR_IP} up
parprouted ${BR_NAME} ${HOST_IFACE}
echo "Bridge ${BR_NAME} created and with connected with the host interface ${HOST_IFACE}."
