# prints a formatted info message with a blue arrow prefix
#
# parameters:
#   $1 - the message to be printed
function pn_info () {
    print -P "%F{blue}==>%f $1"
}

# prints a formatted error message with a red arrow prefix
#
# parameters:
#   $1 - the message to be printed
function pn_error () {
    print -P "%F{red}==>%f $1"
}

# prints a formatted success message with a green arrow prefix
#
# parameters:
#   $1 - the message to be printed
function pn_success () {
    print -P "%F{green}==>%f $1"
}


# refreshes the system by updating, upgrading, and cleaning up brew
# and optionally performs a hard reset by purging the system cache and rebooting
#
# parameters:
#   $1 - the flag to perform a hard reset
function sysre () {
    if [[ -n "$(command -v brew)" ]]
    then
        pn_info "Refreshing packages..."
        brew update -v
        brew upgrade -v
        brew autoremove -v
        brew cleanup -v -s --prune=all
        brew doctor
    fi

    if [[ -n "$(command -v tldr)" ]]
    then
        tldr --update
    fi

    if [[ $1 == "--hard" ]]
    then
        pn_info "Performing hard reset..."
        sudo purge
        sudo reboot
    else
        pn_info "To perform a hard reset, include the --hard flag to the sysre command."
    fi
}

# refreshes the zsh configuration
function zshre () {
    source "$HOME/.zshrc"
    pn_success "zsh resourced"
}

# refreshes the node modules by removing the node_modules directory and reinstalling the dependencies
function nodere () {
    if [[ -d "$PWD/node_modules" ]]
    then
        rm -rdf "$PWD/node_modules"
        npm install
    else
        pn_error "the current directory does not contain a %F{yellow}node_modules%f directory."
    fi
}

# lists the environment variables in the current shell
function envs () {
    for env in $(env | sort)
        do pn_info "$env\n"
    done
}

# displays the weather for the specified city and state
#
# parameters:
#   $1 - the city and state to display the weather for
function weather () {
    if [[ $# == 0 ]]
    then
        pn_info "usage: weather <city>+<state>"
    else
        curl -s "https://v2.wttr.in/$1?u"
    fi
}

# copys the provided input to the clipboard
#
# parameters:
#   $1 - the text to be copied
function copy () {
    if [[ $# == 0 ]]
    then
        pn_info "usage: copy <text>"
    else
        echo "${@}" | pbcopy
    fi
}
