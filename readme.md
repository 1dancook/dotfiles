# Setup and Config Files (Dotfiles)

## Setup Steps for New Machine

2. Running `git --version` in the terminal will prompt to install command line tools. Do that. This takes several minutes (4-5 for download, ~10m for install). Does not require a restart.
3. `cd ~` & `git clone https://github.com/1dancook/dotfiles.git dotfiles`
4. `cd ~/dotfiles`
5. `make` takes around an hour?

Other things to do:
1. Install MESLO nerd font from [here](https://www.nerdfonts.com/font-downloads)
2. after `brew install gh` run `gh auth login` and follow the steps for `https`

## Info

## packages/*
These are the stow packages. Use the `install.sh` or `uninstall.sh` scripts in the directory.

*NOTE: Stow unfortunately has a problem with dot-something style directories. There are issues filed about this on github but nothing has been done yet (even after a few years). For now, unfortunately, some of the packages are hidden.*

## ~/.extras
Use this for anything that is local to a machine. This file doesn't exist in the repo.



