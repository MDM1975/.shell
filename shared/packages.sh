function install () {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function init () {
    eval "$(pyenv init -)"
    eval "$(rbenv init - zsh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export NVM_DIR="$HOME/.nvm"
    export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

    source "$NVM_DIR/nvm.sh"
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
}

[[ -z $(which brew) ]] && install || init
