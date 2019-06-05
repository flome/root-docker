#!/bin/bash
set -e
source /usr/local/root-6.16.00/bin/thisroot.sh

export XAUTHORITY=/root/.Xauthority 

echo " |--- Welcome to the ROOT 6.16.00 Singularity container ---| "
if [[ ! -z "$@" ]]; then
    exec "$@"
fi
    exec bash --rcfile <(echo "PS1='<Singularity: $SINGULARITY_CONTAINER> \u@\h:\w\$ ' ") -i
