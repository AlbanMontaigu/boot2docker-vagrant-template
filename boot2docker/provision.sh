#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
VAGRANT_B2D_CONFIG_REPO="$1"
VAGRANT_B2D_CONFIG_VERSION="$2"
BOOT2DOCKER_CONFIG_DIR="/var/lib/boot2docker/config"
LOGFILE="/var/lib/boot2docker/log/vagrant-provision.log"

# -------------------------------------------------
# Installing boo2docker configuration files
# -------------------------------------------------
echo "== PROVISIONING getting files... [$(date)]"
sudo rm -rvf $BOOT2DOCKER_CONFIG_DIR >> $LOGFILE 2>&1
sudo git clone $VAGRANT_B2D_CONFIG_REPO $BOOT2DOCKER_CONFIG_DIR >> $LOGFILE 2>&1
cd $BOOT2DOCKER_CONFIG_DIR
sudo git checkout $VAGRANT_B2D_CONFIG_VERSION >> $LOGFILE 2>&1
sudo chmod -R 777 ${BOOT2DOCKER_CONFIG_DIR} >> $LOGFILE 2>&1

# -------------------------------------------------
# Running local provisionning file
# -------------------------------------------------
echo "== PROVISIONING executing local... [$(date)]"
$BOOT2DOCKER_CONFIG_DIR/provision.sh >> $LOGFILE 2>&1
