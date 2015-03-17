#!/bin/sh

# =====================================================
# You can add custom commands to your system here
# =====================================================


# --------------------------------------
# Global aliases
# --------------------------------------
alias ls='ls --color=tty'
alias ll='ls -al'
alias tailf='tail -f'


# --------------------------------------
# docker-compose aliases
# --------------------------------------
alias dc-non-interactive='docker run --rm -v $(pwd -P)/etc/docker-compose:/app /var/run/docker.sock:/var/run/docker.sock -e APP_HOME=$(pwd -P) dduportal/docker-compose'
alias dc='docker run --rm -v $(pwd -P)/etc/docker-compose:/app -v /var/run/docker.sock:/var/run/docker.sock -e APP_HOME=$(pwd -P) -ti dduportal/docker-compose'
alias dc-pull='dc pull --allow-insecure-ssl'
alias dc-up='dc up -d'
alias dc-init='dc stop ; dc rm ; dc-pull; dc-up'


# --------------------------------------
# Global Docker aliases
# --------------------------------------
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1"

# Kill all running containers.
alias docker-killall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias docker-cleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias docker-cleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias docker-clean='docker-cleanc || true && docker-cleani'


# --------------------------------------
# Docker devbox aliases and commands
# --------------------------------------
alias devbox-run='docker run -it -v /vagrant:/vagrant -v /vagrant/etc/ncarlier-devbox/.zshrc:/home/dev/.zshrc --name="devbox" ncarlier/devbox'
alias devbox-start='docker start -ia devbox'
alias devbox-rm='docker rm devbox'

# All in one command to start the devbox in all cases
devbox(){
  RUNNING=$(docker inspect --format="{{.State.Running}}" devbox 2> /dev/null)
  if [[ "$RUNNING" == "false" ]]
  then
    devbox-start
  else
    devbox-run
  fi
  return 0
}
