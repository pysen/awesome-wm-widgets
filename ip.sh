#!/bin/sh

WGET=$(which wget)
WGET_OPTS="-O - -q"


AWK=$(which awk)
NIC="tun0"

INTIP=`ip addr show $NIC | $AWK '{ if (NR == 3) { print $4 }}'`

[[ ! -z "${INTIP// }" ]] && echo "$NIC: Connected"
#[[ ! -z "${INTIP// }" ]] && echo "$NIC: $INTIP"

[[ -z "${INTIP// }" ]] && echo "$NIC: Disconnected"

exit 0
