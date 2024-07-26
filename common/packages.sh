# set up homebrew environment based on the system architecture
[[ "$(uname -m)" == "x86_64" ]] && [[ -f "/usr/local/bin/brew" ]] && {
    eval "$(/usr/local/bin/brew shellenv)"
}

[[ "$(uname -m)" == "arm64" ]] && [[ -f "/opt/homebrew/bin/brew" ]] && {
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

# initialize pyenv and rbenv
[[ -n "$(command -v pyenv)" ]] && {
    eval "$(pyenv init -)"
}

[[ -n "$(command -v rbenv)" ]] && {
    eval "$(rbenv init - zsh)"
}

# export NVM and zsh plugin directories
export NVM_DIR="$HOME/.nvm"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

# load NVM and zsh plugins
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && {
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
}

[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && {
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
}

# load additional NVM configuration files
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && {
    \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
}

[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && {
    \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
}
