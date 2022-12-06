echo "USING STOW to uninstall package: $1"
stow -D --target $HOME $1
echo "DONE."
