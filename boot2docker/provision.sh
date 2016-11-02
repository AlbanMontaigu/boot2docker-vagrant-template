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

# General information
echo "[INFO][PROVISIONING] Starting... ($(date))" | tee -a $LOGFILE


# -------------------------------------------------
# Be sure proxy is loaded if any
# -------------------------------------------------
if [ -f $BOOT2DOCKER_PROXY_SCRIPT ]; then
    echo "[INFO] PROXY conf loading for next operations" | tee -a $LOGFILE
    source $BOOT2DOCKER_PROXY_SCRIPT
else
    echo "[INFO] NO PROXY conf found for next operations" | tee -a $LOGFILE
fi


# -------------------------------------------------
# Installing boo2docker configuration files
# -------------------------------------------------
echo "[INFO] Cloning b2d extension files from repo ${VAGRANT_B2D_EXTENSION_REPO}" | tee -a $LOGFILE
sudo rm -rvf $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1
sudo rm -rvf $BOOT2DOCKER_EXTENSION_DIR_TMP >> $LOGFILE 2>&1
git clone $VAGRANT_B2D_EXTENSION_REPO $BOOT2DOCKER_EXTENSION_DIR_TMP >> $LOGFILE 2>&1
echo "[INFO] Clone result is <$?> for b2d extension files" | tee -a $LOGFILE
cd $BOOT2DOCKER_EXTENSION_DIR_TMP
git checkout $VAGRANT_B2D_EXTENSION_VERSION >> $LOGFILE 2>&1
cd ..
sudo mv -fv $BOOT2DOCKER_EXTENSION_DIR_TMP $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1
sudo chmod -R 777 $BOOT2DOCKER_EXTENSION_DIR >> $LOGFILE 2>&1


# -------------------------------------------------
# Running local provisioning file
# -------------------------------------------------
echo "[INFO] Now starting sub scripts..." | tee -a $LOGFILE
source $BOOT2DOCKER_EXTENSION_DIR/provision.sh 2>&1 | tee -a $LOGFILE


# General information
echo "[INFO][PROVISIONING] Ended ! ($(date))" | tee -a $LOGFILE
