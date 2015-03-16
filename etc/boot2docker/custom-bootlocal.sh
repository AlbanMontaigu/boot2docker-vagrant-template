#!/bin/sh

#
# Waiting for /vagrant because it may be not mounted
#
for i in `seq 1 5`; do 
    echo "== Checking existence of /vagrant !"
    if [ -d /vagrant ]; then
        echo "== /vagrant found !"
        break
    else
        echo "== Waiting for existence of /vagrant !"
        sleep 10
    fi
done


#
# ADD Personal alias to docker user's profile
#
cat /var/lib/boot2docker/custom-profile >> /home/docker/.ashrc

#
# In docker 1.5.0, .sock required in NO_PROXY to avoid 404 on commands.
# Will be fixed in docker 1.5.1.
#
echo "== Checking existence .sock in NO_PROXY !"
if (env | grep -q .sock); then
	echo "== .sock already in NO_PROXY !"
else
	NO_PROXY="${NO_PROXY},.sock"
	no_proxy="${no_proxy},.sock"
	echo "== .sock added in NO_PROXY !"
fi
