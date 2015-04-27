#!/bin/sh

# =====================================================
# You can add custom commands to your system here
# =====================================================


# --------------------------------------
# Global aliases
# --------------------------------------
alias ls='ls --color=tty'
alias ll='ls -al'


# --------------------------------------
# Docker compose aliases
# --------------------------------------
alias dc='docker run --rm -v $(pwd -P):/$(pwd -P) -v /var/run/docker.sock:/var/run/docker.sock -ti -w="$(pwd -P)" amontaigu/docker-compose'
alias dc-pull='dc pull --allow-insecure-ssl'
alias dc-up='dc up -d --allow-insecure-ssl'
alias dc-init='dc stop ; dc rm ; dc-pull; dc-up'


# --------------------------------------
# Docker aliases and functions
# --------------------------------------

# Docker cmd shortener
alias dk="docker"

# Show ip of a docker container
alias dk-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1"

# Kill all running containers.
alias dk-killall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dk-cleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dk-cleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dk-clean='dk-cleanc || true && dk-cleani'

# Get all proxy env var in a docker cmd line friendly format
dk_proxy_env(){
    prx_env="-e "$(env | grep HTTP_PROXY)
    prx_env=$prx_env" -e "$(env | grep http_proxy)
    prx_env=$prx_env" -e "$(env | grep NO_PROXY)
    prx_env=$prx_env" -e "$(env | grep no_proxy)
    echo "${prx_env}"
}


# --------------------------------------
# Docker dk-devbox aliases and commands
# --------------------------------------
alias dk-devbox-run='docker run -it -v /vagrant:/vagrant -v /vagrant/boot2docker/docker/dk-devbox/.zshrc:/home/dev/.zshrc -v /var/run/docker.sock:/var/run/docker.sock --name="dk-devbox" amontaigu/docker-devbox'
alias dk-devbox-start='docker start -ia dk-devbox'
alias dk-devbox-rm='docker rm dk-devbox'

# All in one command to start the dk-devbox in all cases
dk_devbox(){

	# If redsocks is required (you have a proxy) ensure its started (even if in custom-bootlocal)
	#dk_redsocks
	
    # Go to the devbox
    RUNNING=$(docker inspect --format="{{.State.Running}}" dk-devbox 2> /dev/null)
    if [[ "$RUNNING" == "false" ]]
    then
	    echo "Starting dk-devbox docker container..."
        dk-devbox-start
    else
        if [[ "$RUNNING" != "true" ]]
        then
		    echo "Running dk-devbox docker container..."
            dk-devbox-run
        else
		    echo "dk-devbox docker container is already started !"
	    fi
    fi
}

# More convenient
alias dk-devbox="dk_devbox"


# ------------------------------------------------------------
# Redsocks container to avoid proxy definition 
# @see https://registry.hub.docker.com/u/ncarlier/redsocks/
#
# Change the configuration 1.2.3.4 3128 to your correct proxy
# ------------------------------------------------------------
alias dk-redsocks-run='docker run --privileged=true --net=host -v /vagrant/boot2docker/docker/dk-redsocks/whitelist.txt:/etc/redsocks-whitelist.txt --name="dk-redsocks" -d ncarlier/redsocks 1.2.3.4 3128'
alias dk-redsocks-start='docker start -ia dk-redsocks'
alias dk-redsocks-reverse-iptables='iptables-save | grep -v REDSOCKS | iptables-restore'
alias dk-redsocks-stop='docker stop dk-redsocks && dk-redsocks-reverse-iptables'

# All in one command to start the dk-redsocks in all cases
dk_redsocks(){
    RUNNING=$(docker inspect --format="{{.State.Running}}" dk-redsocks 2> /dev/null)
    if [[ "$RUNNING" == "false" ]]
    then
		echo "Starting dk-redsocks docker container..."
        dk-redsocks-start
    else
        if [[ "$RUNNING" != "true" ]]
        then
		    echo "Running dk-redsocks docker container..."
	        dk-redsocks-run
        else
		    echo "dk-redsocks docker container is already started !"
        fi
    fi
}

# More convenient
alias dk-redsocks="dk_redsocks"

