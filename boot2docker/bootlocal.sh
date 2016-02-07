#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
BOOT2DOCKER_CONFIG_BOOTLOCAL="$BOOT2DOCKER_CONFIG_DIR/bootlocal.sh"
LOGFILE="$BOOT2DOCKER_CONFIG_DIR/bootlocal.log"

# -------------------------------------------------
# Execute bootlocal.sh if present to enable
# live customization
# -------------------------------------------------
if [ -f $BOOT2DOCKER_CONFIG_DIR ]; then
   echo "== BOOTLOCAL execution..."
   $BOOT2DOCKER_CONFIG_BOOTLOCAL > $LOGFILE
else
   echo "== BOOTLOCAL not executed, try PROVISION before"
fi
