# check if xcode is installed
[[ ! "$(command -v xcode-select)" ]] && xcode-select --install

# check if homebrew is installed
[[ ! "$(command -v brew)" ]] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
brew install go
brew install mage
brew install gcc
brew install curl
brew install jq
brew install ack
brew install tlrc
brew install htop
brew install bat

# install zsh plugins
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
