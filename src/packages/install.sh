#!/usr/bin/env zsh

if [[ ! $(which brew) ]] && {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
