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
# This should fix the mail send issue for example...
# -----------------------------------------------------------------------
#echo "== Customizing network configuration to the bridge with gateway ${PARENT_HOST_NETWORK_GATEWAY}"

#echo "-- Prevent-del default gw from eth2"
#sudo route del default eth2
#echo "-- Prevent-del gw host from eth2"
#sudo route del $PARENT_HOST_NETWORK_GATEWAY eth2

#echo "-- (Re) add default gw host in eth2"
#sudo route add $PARENT_HOST_NETWORK_GATEWAY eth2
#echo "-- (Re) add default gw in eth2"
#sudo route add default gw $PARENT_HOST_NETWORK_GATEWAY eth2

# No more need to this
#echo "-- (Re) del default gw in eth0"
#sudo route del default eth0

#echo "== Network configuration to the bridge customized !"



# -----------------------------------------------------------------------
# If you need a generic proxy for your docker containers uncoment it
# and do not forget to edit custom-commands.sh for the parent proxy conf
# -----------------------------------------------------------------------

# Ensure commands are available
#echo "== Loading custom commands"
#. ./var/lib/boot2docker/custom-commands.sh
#echo "== Custom commands loaded !"

# Starts redsocks
#echo "== Starting redsocks"
#dk_redsocks
#echo "== Redsocks started !"

