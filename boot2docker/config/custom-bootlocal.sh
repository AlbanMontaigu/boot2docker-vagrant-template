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
# In docker 1.5.0, .sock required in NO_PROXY to avoid 404 on commands.
# Will be fixed in docker 1.5.1.
# -----------------------------------------------------------------------
echo "== Checking existence .sock in NO_PROXY !"
if (env | grep -q .sock); then
	echo "== .sock already in NO_PROXY !"
else
	NO_PROXY="${NO_PROXY},.sock"
	no_proxy="${no_proxy},.sock"
	echo "== .sock added in NO_PROXY !"
fi


# -----------------------------------------------------------------------
# If you need a generic proxy for your docker containers uncoment it
# and do not forget to edit custom-commands.sh for the parent proxy conf
# -----------------------------------------------------------------------
# Ensure commands are available
#. ./etc/profile.d/custom-commands.sh
# Starts redsocks
#dk_redsocks


