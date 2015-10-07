#!/bin/sh

# -------------------------------------------------
# Update configuration files
# -------------------------------------------------
cp -f /vagrant/boot2docker/config/custom-* /var/lib/boot2docker
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
# Solves insecure registry (example)
# -------------------------------------------------
#if grep -q my.inscure.registry.url /var/lib/boot2docker/profile; then
#    echo "== nothing todo in boot2docker/profile !"
#else
#    echo 'EXTRA_ARGS="--insecure-registry my.inscure.registry.url"' >> /var/lib/boot2docker/profile
#    echo "== boot2docker/profile updated with registry !"
#fi


# -------------------------------------------------
# Docker profile customization (example)
# -------------------------------------------------
#if grep -q my_option /var/lib/boot2docker/profile; then
#    echo "== nothing todo in boot2docker/profile for my_key_command !"
#else
#    echo -e '\nDOCKER_OPTS=my_option\n' >> /var/lib/boot2docker/profile
#    echo "== boot2docker/profile updated with my_option !"
#fi

