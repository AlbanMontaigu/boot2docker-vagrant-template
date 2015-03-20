#!/bin/sh

# -------------------------------------------------
# Update configuration files
# -------------------------------------------------
cp -f /vagrant/etc/boot2docker/custom-* /var/lib/boot2docker
echo "== custom-* updated !"


# -------------------------------------------------
# Generate bootlocal.sh if not exist
# -------------------------------------------------
if [ -f /var/lib/boot2docker/bootlocal.sh ]; then
   echo "== bootlocal.sh exists !"
else
   echo -e "#!/bin/sh\n" > /var/lib/boot2docker/bootlocal.sh
   chmod 777 /var/lib/boot2docker/bootlocal.sh
   echo "== bootlocal.sh created !"
fi


# -------------------------------------------------
# ADD custom commands to bootlocal.sh
# -------------------------------------------------
if grep -q custom-bootlocal /var/lib/boot2docker/bootlocal.sh; then
    echo "== nothing todo in bootlocal.sh !"
else
    echo -e "\n# Custom instructions\n/var/lib/boot2docker/custom-bootlocal.sh\n" >> /var/lib/boot2docker/bootlocal.sh
	chmod 777 /var/lib/boot2docker/custom-bootlocal.sh
    echo "== bootlocal.sh updated !"
fi


# -------------------------------------------------
# Solves insecure registry
# -------------------------------------------------
#if grep -q my.inscure.registry.url /var/lib/boot2docker/profile; then
#    echo "== nothing todo in boot2docker/profile !"
#else
#    echo 'EXTRA_ARGS="--insecure-registry my.inscure.registry.url"' >> /var/lib/boot2docker/profile
#    echo "== boot2docker/profile updated with registry !"
#fi


# -------------------------------------------------
# Solves AUFS layers limitation
# -------------------------------------------------
if grep -q devicemapper /var/lib/boot2docker/profile; then
    echo "== nothing todo in boot2docker/profile for devicemapper !"
else
    echo -e '\nDOCKER_STORAGE=devicemapper\n' >> /var/lib/boot2docker/profile
    echo "== boot2docker/profile updated with devicemapper !"
fi
