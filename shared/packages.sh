function install () {
    [[ "$(xcode-select -p)" != "/Library/Developer/CommandLineTools" ]] && xcode-select --install

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    [[ "$(uname -m)" == "x86_64" ]] && eval "$(/usr/local/bin/brew shellenv)"
    [[ "$(uname -m)" == "arm64" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

    brew install rbenv ruby-build
    rbenv install 3.2.2
    rbenv global 3.2.2

    brew install pyenv
    pyenv install 3.12.0
    pyenv global 3.12.0

    brew install nvm

    brew install go mage

    brew install curl

    brew install wget

    brew install jq

    brew install ack

    brew install tree

    brew install tldr

    brew install htop

    brew install bat

    brew install zsh-autosuggestions

    brew install zsh-syntax-highlighting

    init
}

function init () {
    [[ "$(uname -m)" == "x86_64" ]] && eval "$(/usr/local/bin/brew shellenv)"
    [[ "$(uname -m)" == "arm64" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    eval "$(pyenv init -)"
    eval "$(rbenv init - zsh)"

    export NVM_DIR="$HOME/.nvm"
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

    source "$NVM_DIR/nvm.sh"
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
}

[[ "$(which brew)" == "brew not found" ]] && install || init
