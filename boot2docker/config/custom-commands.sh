#!/bin/sh

# =====================================================
# You can add custom commands to your system here
# =====================================================


# --------------------------------------
# Global aliases
# --------------------------------------
alias ls='ls --color=tty'
alias ll='ls -al'

# Enable to update box config live inside
alias b2d-provision="sudo /vagrant/boot2docker/config/provision.sh"
alias b2d-custom-bootlocal="sudo /vagrant/boot2docker/config/custom-bootlocal.sh"
alias b2d-custom-commands="\. /vagrant/boot2docker/config/custom-commands.sh"
alias b2d-custom-profile="\. /vagrant/boot2docker/config/custom-profile"
alias b2d-update="b2d-provision && b2d-custom-bootlocal && b2d-custom-commands && b2d-custom-profile"
# @see https://forums.virtualbox.org/viewtopic.php?f=3&t=33201
# @see https://www.virtualbox.org/ticket/12597
# @see https://www.virtualbox.org/ticket/9069
alias b2d-sync='sudo -i sh -c "sync && echo 3 > /proc/sys/vm/drop_caches && exit"'


# --------------------------------------
# Docker compose aliases
# --------------------------------------
alias dc='docker run --rm -v $(pwd -P):/$(pwd -P) -v /var/run/docker.sock:/var/run/docker.sock -ti -w="$(pwd -P)" -e COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME:-app} amontaigu/docker-compose:1.5.1'
alias dc-up='dc up -d'
alias dc-init='dc stop ; dc rm -f ; dc pull ; dc-up'
alias dc-reset='dc stop ; dc rm -f ; dc-up'

# Compose with network feature enabled (need to be separated for backward compat)
alias dcn="dc --x-networking"
alias dcn-up='dcn up -d'
alias dcn-init='dcn stop ; dcn rm -f ; dcn pull ; dcn-up'
alias dcn-reset='dcn stop ; dcn rm -f ; dcn-up'

# Change compose app prefix
dc_prefix(){

    if [ $# -eq 0 ]; then
        echo $COMPOSE_PROJECT_NAME
    else
        export COMPOSE_PROJECT_NAME=$1
    fi
}
alias dc-prefix="dc_prefix"


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

# Get a ssh inside a container
dk_sh() {
    docker exec -ti $1 /bin/sh
}
alias dk-sh='dk_sh'

# See files tree in a container
dk_ls() {
    docker exec -ti $1 /bin/ls -l $2
}
alias dk-ls='dk_ls'

# See files content inside a container
dk_cat() {
    docker exec -ti $1 /bin/cat $2
}
alias dk-cat='dk_cat'

# Edit files content inside a container
dk_vi() {
    docker exec -ti $1 /bin/vi $2
}
alias dk-vi='dk_vi'

# Misc
alias dk-flogs="docker logs -f $1"


# --------------------------------------
# Docker dk-devbox aliases and commands
# --------------------------------------
alias dk-devbox-run='docker run -it -v /vagrant:/vagrant -v /vagrant/boot2docker/docker/dk-devbox/.zshrc:/home/dev/.zshrc -v /var/run/docker.sock:/var/run/docker.sock -e COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME:-app} --name="dk-devbox" amontaigu/docker-devbox:1.9.0'
alias dk-devbox-start='docker start -ia dk-devbox'
alias dk-devbox-rm='docker rm dk-devbox'

# All in one command to start the dk-devbox in all cases
dk_devbox(){

    # If redsocks is required (you have a proxy) ensure its started in custom-bootlocal
    
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
alias dk-redsocks-run='docker run --privileged=true --net=host -v /vagrant/boot2docker/docker/dk-redsocks/whitelist.txt:/etc/redsocks-whitelist.txt --name="dk-redsocks" -d amontaigu/redsocks 1.2.3.4 3128'
alias dk-redsocks-start='docker start dk-redsocks'
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

