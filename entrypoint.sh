#!/usr/bin/env sh
set -euo pipefail


# Remove config lock
if [[ -f /home/flexget/.flexget/.config-lock ]]; then
    rm /home/flexget/.flexget/.config-lock
fi

# Keep FlexGet updated
echo "Checking for FlexGet updates ..."
pip install --upgrade --quiet pip
pip install --upgrade --quiet flexget


# Set web UI password
flexget web passwd "listmygames"

flexget daemon start