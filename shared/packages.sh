function install () {
  # check if xcode is installed
  [[ ! "$(command -v xcode-select)" ]] && xcode-select --install

  # install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # set up homebrew environment based on the system architecture
  [[ "$(uname -m)" == "x86_64" ]] && eval "$(/usr/local/bin/brew shellenv)"
  [[ "$(uname -m)" == "arm64" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

  # install and configure rbenv and ruby
  brew install rbenv ruby-build
  rbenv install 3.2.2
  rbenv global 3.2.2

  # install and configure pyenv and python
  brew install pyenv
  pyenv install 3.12.0
  pyenv global 3.12.0

  # install various development tools and utilities using homebrew
  brew install nvm
  brew install maven
  brew install go mage
  brew install curl
  brew install wget
  brew install jq
  brew install xq
  brew install yq
  brew install ack
  brew install tree
  brew install tldr
  brew install htop
  brew install bat

  # install zsh plugins
  brew install zsh-autosuggestions
  brew install zsh-syntax-highlighting

  # call the init function to initialize the installed tools and plugins
  init
}

function init () {
  # set up homebrew environment based on the system architecture
  [[ "$(uname -m)" == "x86_64" ]] && eval "$(/usr/local/bin/brew shellenv)"
  [[ "$(uname -m)" == "arm64" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

  # initialize pyenv and rbenv
  eval "$(pyenv init -)"
  eval "$(rbenv init - zsh)"

  # export NVM and zsh plugin directories
  export NVM_DIR="$HOME/.nvm"
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"

  # source NVM and zsh plugins
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  # source additional NVM configuration files
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
}

init
