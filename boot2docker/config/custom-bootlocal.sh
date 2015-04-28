#!/bin/sh

# =====================================================
# You can customize your system here
# =====================================================


# ----------------------------------------------------
# Waiting for /vagrant because it may be not mounted
# ----------------------------------------------------
echo "== Checking existence of /vagrant !"
for i in `seq 1 5`; do 
    if [ -d /vagrant ]; then
        echo "== /vagrant found !"
        break
    else
        echo "== Waiting for existence of /vagrant !"
        sleep 10
    fi
done


# ----------------------------------------------------
# ADD custom commands to the system
# ----------------------------------------------------
echo "== Adding custom-commands.sh to /etc/profile.d/ !"
cp /var/lib/boot2docker/custom-commands.sh /etc/profile.d/custom-commands.sh
chmod 777 /etc/profile.d/custom-commands.sh
echo "== custom-commands.sh added !"


# ----------------------------------------------------
# ADD personal stuff to user's profile
# ----------------------------------------------------
echo "== Adding custom-profile to user ~/.ashrc !"
cat /var/lib/boot2docker/custom-profile >> /home/docker/.ashrc
chmod 777 /home/docker/.ashrc
echo "== custom-profile done !"


# -----------------------------------------------------------------------
# Update /etc/hosts to add required hosts if needed
# -----------------------------------------------------------------------
#echo "== Updating /etc/hosts aliases with the following lines :"
#cat << EOF | sudo tee -a /etc/hosts

# Required alias for localhost for ump portal
#127.0.0.1 sampleHostName
#EOF
#echo "== Updating /etc/hosts done !"



# -----------------------------------------------------------------------
# Getting parent host gateway in the environment (might be usefull)
# -----------------------------------------------------------------------
#echo "== Setting  PARENT_HOST_NETWORK_GATEWAY "
#export PARENT_HOST_NETWORK_GATEWAY=$(cat /var/lib/boot2docker/PARENT_HOST_NETWORK_GATEWAY)
#echo "== PARENT_HOST_NETWORK_GATEWAY set to ${PARENT_HOST_NETWORK_GATEWAY} !"


# -----------------------------------------------------------------------
# Reroute all network to eth2 which is bridged (see vagrant file).
# This should fix the mail send issue...
#
# Note : network configuration seem to persist so instead of detect it,
#        clean all and redo it
# -----------------------------------------------------------------------
#echo "== Customizing network configuration to the bridge with gateway ${PARENT_HOST_NETWORK_GATEWAY}"

# Worldline gateway may change depending on the site
# so it should be auto detected from parent host
#sudo route del default eth2
#sudo route add default gw ${PARENT_HOST_NETWORK_GATEWAY} eth2

# No more need to this
#sudo route del default eth0

#echo "== Network configuration to the bridge customized !"



# -----------------------------------------------------------------------
# If you need a generic proxy for your docker containers uncoment it
# and do not forget to edit custom-commands.sh for the parent proxy conf
# -----------------------------------------------------------------------

# Ensure commands are available
#echo "== Loading custom commands"
#. ./etc/profile.d/custom-commands.sh
#echo "== Custom commands loaded !"

# Starts redsocks
#echo "== Starting redsocks"
#dk_redsocks
#echo "== Redsocks started !"

