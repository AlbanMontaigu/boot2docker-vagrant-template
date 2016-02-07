#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
BOOT2DOCKER_VAGRANT_CONFIG_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git"
LOGFILE="$BOOT2DOCKER_CONFIG_DIR/provision.log"

# -------------------------------------------------
# Installing boo2docker configuration files
# -------------------------------------------------
echo "== PROVISIONING files..."
sudo rm -rvf $BOOT2DOCKER_CONFIG_DIR > $LOGFILE
sudo git clone $BOOT2DOCKER_VAGRANT_CONFIG_REPO $BOOT2DOCKER_CONFIG_DIR > $LOGFILE
sudo chmod -R 777 ${BOOT2DOCKER_CONFIG_DIR} > $LOGFILE
