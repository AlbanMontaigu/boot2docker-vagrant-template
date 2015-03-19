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
alias dc='docker run --rm -v $(pwd -P)/etc/docker-compose:/app -v /var/run/docker.sock:/var/run/docker.sock -e APP_HOME=$(pwd -P) -ti dduportal/docker-compose'
alias dc-pull='dc pull --allow-insecure-ssl'
alias dc-up='dc up -d --allow-insecure-ssl'
alias dc-init='dc stop ; dc rm ; dc-pull; dc-up'


# --------------------------------------
# Docker aliases
# --------------------------------------
alias dk-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1"

# Kill all running containers.
alias dk-killall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dk-cleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dk-cleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dk-clean='dk-cleanc || true && dk-cleani'


# --------------------------------------
# Docker dk-devbox aliases and commands
# --------------------------------------
alias dk-devbox-run='docker run -it -v /vagrant:/vagrant -v /vagrant/etc/docker-devbox/.zshrc:/home/dev/.zshrc -v /var/run/docker.sock:/var/run/docker.sock --name="dk-devbox" --net=host amontaigu/docker-devbox'
alias dk-devbox-start='docker start -ia dk-devbox'
alias dk-devbox-rm='docker rm dk-devbox'

# All in one command to start the dk-devbox in all cases
dk-devbox(){
  RUNNING=$(docker inspect --format="{{.State.Running}}" dk-devbox 2> /dev/null)
  if [[ "$RUNNING" == "false" ]]
  then
    dk-devbox-start
  else
    dk-devbox-run
  fi
  return 0
}

# ------------------------------------------------------------
# Redsocks container to avoid proxy definition 
# @see https://registry.hub.docker.com/u/ncarlier/redsocks/
#
# Change the configuration 1.2.3.4 3128 to your correct proxy
# ------------------------------------------------------------
alias dk-redsocks-start='docker run --privileged=true --net=host -v /vagrant/etc/docker-redsocks/whitelist.txt:/etc/redsocks-whitelist.txt --name="dk-redsocks" -d ncarlier/redsocks 1.2.3.4 3128'
alias dk-redsocks-start='docker start -ia dk-redsocks'
alias dk-redsocks-reverse-iptables='iptables-save | grep -v REDSOCKS | iptables-restore'
alias dk-redsocks-stop='docker stop dk-redsocks && dk-redsocks-reverse-iptables'

# All in one command to start the dk-redsocks in all cases
dk-redsocks(){
  RUNNING=$(docker inspect --format="{{.State.Running}}" dk-redsocks 2> /dev/null)
  if [[ "$RUNNING" == "false" ]]
  then
    dk-redsocks-start
  else
    dk-redsocks-run
  fi
  return 0
}