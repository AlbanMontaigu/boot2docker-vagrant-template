#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
BOOT2DOCKER_VAGRANT_CONFIG_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git"

# -------------------------------------------------
# Installing boo2docker configuration files
# -------------------------------------------------
echo "== PROVISIONING files..."
sudo rm -rvf $BOOT2DOCKER_CONFIG_DIR > $BOOT2DOCKER_CONFIG_DIR/$0.log
sudo git clone $BOOT2DOCKER_VAGRANT_CONFIG_REPO $BOOT2DOCKER_CONFIG_DIR > $BOOT2DOCKER_CONFIG_DIR/$0.log
sudo chmod -R 777 ${BOOT2DOCKER_CONFIG_DIR} > $BOOT2DOCKER_CONFIG_DIR/$0.log
