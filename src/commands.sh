#!/usr/bin/env zsh

function ls () {
    command ls -aGS
}

function zshre () {
    source "$HOME/.zshrc"
    print -P "%F{green}==>%f zsh resourced"
}

function refresh () {
    brew update -v
    brew upgrade -v
    brew autoremove -v
    brew cleanup -v --prune=all

    sudo purge
    sudo reboot
}

function envs () {
    for env in ${$(env | sort)}
        do print -P "%F{blue}==>%f $env\n"
    done
}

function weather () {
    [[ $# == 0 ]] && {
        print -P '\n%F{red}usage%f %F{blue}==>%f weather <city>+<state>\n'
    } || {
        local WEATHER=$(curl -s "https://v2.wttr.in/$1?u")
        echo $WEATHER | grep 'Weather:' | sed 's|Weather:||'
        echo $WEATHER | grep 'Location:' | sed 's|Location:||'
    }
}

function uuid () {
    uuidgen | tr "[:upper:]" "[:lower:]"
}
