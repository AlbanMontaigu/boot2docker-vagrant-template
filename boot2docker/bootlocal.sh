#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
BOOT2DOCKER_CONFIG_BOOTLOCAL="$BOOT2DOCKER_CONFIG_DIR/bootlocal.sh"

# -------------------------------------------------
# Execute bootlocal.sh if present to enable
# live customization
# -------------------------------------------------
if [ -f BOOT2DOCKER_CONFIG_DIR ]; then
   echo "== Executing $BOOT2DOCKER_CONFIG_BOOTLOCAL..."
   $BOOT2DOCKER_CONFIG_BOOTLOCAL
   echo "== $BOOT2DOCKER_CONFIG_BOOTLOCAL executed"
else
   echo "== $BOOT2DOCKER_CONFIG_BOOTLOCAL not present execute a provision before !"
fi
