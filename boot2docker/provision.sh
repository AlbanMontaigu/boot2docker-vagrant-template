#!/bin/sh

# -------------------------------------------------
# Parametrization
# -------------------------------------------------
VAGRANT_B2D_EXTENSION_REPO="$1"
VAGRANT_B2D_EXTENSION_VERSION="$2"
BOOT2DOCKER_PROXY_SCRIPT="/etc/profile.d/proxy.sh"
BOOT2DOCKER_EXTENSION_DIR="/var/lib/boot2docker/extension"
BOOT2DOCKER_EXTENSION_DIR_TMP="/tmp/extension"
LOGFILE="/var/lib/boot2docker/log/vagrant-provision.log"


# -------------------------------------------------
# Be sure proxy is loaded if any
# -------------------------------------------------
if [ -f $BOOT2DOCKER_PROXY_SCRIPT ]; then
    source $BOOT2DOCKER_PROXY_SCRIPT
fi


# -------------------------------------------------
# Installing boo2docker configuration files
# -------------------------------------------------
echo "== PROVISIONING getting files... [$(date)]"
sudo rm -rvf $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1
sudo rm -rvf $BOOT2DOCKER_EXTENSION_DIR_TMP >> $LOGFILE 2>&1
git clone $VAGRANT_B2D_EXTENSION_REPO $BOOT2DOCKER_EXTENSION_DIR_TMP >> $LOGFILE 2>&1
cd $BOOT2DOCKER_EXTENSION_DIR_TMP
git checkout $VAGRANT_B2D_EXTENSION_VERSION >> $LOGFILE 2>&1
cd ..
sudo mv -fv $BOOT2DOCKER_EXTENSION_DIR_TMP $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1
sudo chmod -R 777 $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1


# -------------------------------------------------
# Running local provisionning file
# -------------------------------------------------
echo "== PROVISIONING running... [$(date)]"
source $BOOT2DOCKER_EXTENSION_DIR/provision.sh >> $LOGFILE 2>&1
