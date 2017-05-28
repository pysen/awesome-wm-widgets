#!/bin/sh

WGET=$(which wget)
WGET_OPTS="-O - -q"

AWK=$(which awk)
NIC="wlp3s0"

INTIP=`ip addr show tun0 | $AWK '{ if (NR == 3) { print $4 }}'`

[[ ! -z "${INTIP// }" ]] && echo "tun0: Connected"
#[[ ! -z "${INTIP// }" ]] && echo "tun0: $INTIP"

[[ -z "${INTIP// }" ]] && echo "tun0: Disconnected"

exit 0
