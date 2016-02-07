#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
BOOT2DOCKER_VAGRANT_CONFIG_REPO="https://github.com/AlbanMontaigu/boot2docker-vagrant-config.git"

# -------------------------------------------------
# Generate configuration configuration files
# -------------------------------------------------
echo "== Generating configuration files in ${BOOT2DOCKER_CONFIG_DIR}"
sudo rm -rf $BOOT2DOCKER_CONFIG_DIR
sudo git clone $BOOT2DOCKER_VAGRANT_CONFIG_REPO $BOOT2DOCKER_CONFIG_DIR
sudo chmod -R 777 ${BOOT2DOCKER_CONFIG_DIR}
echo "== Configuration generated in ${BOOT2DOCKER_CONFIG_DIR}"
