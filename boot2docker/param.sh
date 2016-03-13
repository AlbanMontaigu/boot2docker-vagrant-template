#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_EXTENSION_DIR="/var/lib/boot2docker/extension"
BOOT2DOCKER_EXTENSION_PARAM="$BOOT2DOCKER_EXTENSION_DIR/param.sh"
LOGFILE="/var/lib/boot2docker/log/vagrant-param.log"

# -------------------------------------------------
# Execute param.sh if present to enable
# live customization
# -------------------------------------------------
if [ -f $BOOT2DOCKER_EXTENSION_PARAM ]; then
   echo "== PARAM execution... [$(date)] "
   $BOOT2DOCKER_EXTENSION_PARAM "$1" "$2 ">> $LOGFILE 2>&1
else
   echo "== PARAM not found, try PROVISION before [$(date)] "
fi
