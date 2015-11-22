# =========================================
# Global configuration file for zsh
# =========================================

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# ----------------------------------------
# Global aliases
# ----------------------------------------
alias ls='ls --color=tty'
alias ll='ls -al'


# ----------------------------------------
# Docker compose aliases
# ----------------------------------------
alias dc='docker-compose'
alias dc-up='dc up -d'
alias dc-init='dc stop ; dc rm -f; dc pull ; dc-up'
alias dc-reset='dc stop ; dc rm -f ; dc-up'

# Compose with network feature enabled (need to be separated for backward compat)
alias dcn="dc --x-networking"
alias dcn-up='dcn up -d'
alias dcn-init='dcn stop ; dcn rm -f; dcn pull ; dcn-up'
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


# ----------------------------------------
# Docker aliases
# ----------------------------------------

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
