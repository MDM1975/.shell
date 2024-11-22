# set up homebrew environment based on the system architecture
if [[ "$(uname -m)" == "x86_64" ]]; then
    if [[ -f "/usr/local/bin/brew" ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

if [[ "$(uname -m)" == "arm64" ]]; then
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# initialize pyenv and rbenv
if [[ -n "$(command -v pyenv)" ]]; then
    eval "$(pyenv init -)"
fi

if [[ -n "$(command -v rbenv)" ]]; then
    eval "$(rbenv init - zsh)"
fi

# export NVM and zsh plugin directories
export NVM_DIR="$HOME/.nvm"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

# load NVM and zsh plugins
if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# load additional NVM configuration files
if [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]; then
    \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
fi

if [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]; then
    \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi
