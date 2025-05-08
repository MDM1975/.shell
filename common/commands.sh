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
    if [[ -n "$(command -v brew)" ]]; then
        pn_info "Refreshing packages..."
        brew update -v
        brew upgrade -v
        brew autoremove -v
        brew cleanup -v -s --prune=all
        brew doctor
    fi

    if [[ $1 == "--hard" ]]; then
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

# copies the provided input to the clipboard
#
# parameters:
#   $1 - the text to be copied
function copy () {
    if [[ $# == 0 ]]; then
        pn_info "usage: copy <text>"
    else
        echo "${@}" | pbcopy
    fi
}
