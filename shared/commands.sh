function pn_info () {
    print -P "%F{blue}==>%f $1"
}

function pn_error () {
    print -P "%F{red}==>%f $1"
}

function pn_success () {
    print -P "%F{green}==>%f $1"
}

function zshre () {
    source "$HOME/.zshrc"
    pn_success "zsh resourced"
}

function sysre () {
    brew update -v
    brew upgrade -v
    brew autoremove -v
    brew cleanup -v --prune=all

    [[ $1 == "--hard" ]] && {
        sudo purge
        sudo reboot
    } || {
        pn_info "To perform a hard reset, include the %F{yellow}--hard%f flag to the sysre command."
    }
}

function nodere () {
    [[ -d "./node_modules" ]] && {
        rm -rdf "./node_modules"
        npm install
    } || {
        pn_error "The current directory does not contain a %F{yellow}node_modules%f directory."
    }
}

function envs () {
    for env in ${$(env | sort)}
        do pn_info "$env\n"
    done
}

function weather () {
    [[ $# == 0 ]] && {
        pn_info "usage: weather <city>+<state>"
    } || {
        local WEATHER=$(curl -s "https://v2.wttr.in/$1?u")

        pn_info "$($WEATHER | grep 'Weather:' | sed 's|Weather:||')"
        pn_info "$($WEATHER | grep 'Location:' | sed 's|Location:||')"
    }
}
