echo "USING STOW to install package: $1"
stow --adopt --dotfiles --target $HOME $1
git restore .
echo "DONE."

