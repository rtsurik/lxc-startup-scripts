#!/bin/bash

BR_NAME="br0"

killall -9 parprouted
ifconfig ${BR_NAME} down
brctl delbr ${BR_NAME}

echo "Bridge ${BR_NAME} disconnected from the host iface and destroyed."
