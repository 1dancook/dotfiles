# Setup and Config Files (Dotfiles)

These are my dotfiles. If you stumble on this there might be something useful that you can use, but I'd encourage you to make your own rather than copy blindly. There are a number of things that are specific to my workflow.

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
TODO: new in [Stow 2.4.0](http://git.savannah.gnu.org/cgit/stow.git/tree/NEWS) `--dotfiles` now works with directores

## ~/.extras
Use this for anything that is local to a machine. This file doesn't exist in the repo.

## Git diff-highlight issue
See [here](https://github.com/Homebrew/homebrew-core/issues/15588) about the issue.

`echo "$(brew --prefix git)/share/git-core/contrib/diff-highlight/diff-highlight"`

Should give the right directory. Seems to be symlinked.

But where does it go!?

## Files and what they are for:

In shell-files:

- `dot-functions` are for shell functions
- `dot-path` is for any path I need to add
- `dot-exports` is for EXPORT
- `dot-aliases` for aliases
- `dot-zshrc` 
- `dot-zprofile`

Another that will be sourced is `~/.extra` which can contain anything that I don't want to be committed.



