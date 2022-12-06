# Setup and Config Files (Dotfiles)

## Using Makefile in the parent directory

### `make setup`
This will install in the following order:

- xcode command line tools
- homebrew
- gnu stow (necessary for using dotfiles)
- pyenv + python, pipx
- node + npm

### `make ohmyzsh`
install oh my zsh and spaceship theme

### `make brew`
From https://github.com/mathiasbynens/dotfiles/blob/main/brew.sh

Will install different command line utilities via homebrew.

### `make pipx` + `make pip`
Will install different applications and packages with pipx and pip.


### `make essentials`
Will install ohmyzsh, brew pacakges, pipx packages, and pip packages

## packages/*
These are the stow packages. Use the makefile to install.

## ~/.extra

Use this for anything that is local to a machine. There is nothing in the shell packages.



