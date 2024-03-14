# Zsh Configuration

This repository contains a custom Zsh configuration that enhances the shell experience with useful aliases, functions, options, and a custom prompt.

## Features

- Convenient aliases for common tasks and commands
- Custom functions for displaying formatted messages, refreshing configurations, and more
- Optimized shell options for autocompletion, directory navigation, history management, and input/output behavior
- Stylish prompt displaying current directory, time, date, and Git branch information
- Package installation and initialization for various development tools and plugins

## Installation

1. Clone this repository to your local machine:

```sh
git clone https://github.com/MDM1975/.shell.git ~/.shell
```

2. Add the following lines to your `.zshrc` file:

```sh
source $HOME/.shell/index.sh
```

3. Restart your terminal or run `source ~/.zshrc` to apply the changes.

## Usage

Once installed, you can start using the provided aliases, functions, and the custom prompt in your Zsh shell.

## Customization

Feel free to customize the configuration files according to your preferences. You can modify the aliases, functions, options, and prompt to suit your needs.

To add functionality that is specific to your machine, you can create a `private` directory in `.shell` and add your script files there. These files will be automatically sourced.
