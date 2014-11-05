#!/bin/sh

# Waiting for /vagrant because it may be not mounted
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


# ADD Personal alias to docker user's profile
cat /var/lib/boot2docker/custom-profile >> /home/docker/.ashrc

