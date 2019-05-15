#!/bin/bash
set -e
source /usr/local/root-6.16.00/bin/thisroot.sh

export XAUTHORITY=/root/.Xauthority 
exec "$@"