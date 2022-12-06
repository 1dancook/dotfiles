# INSTALL OH MY ZSH
echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# also install the 'spaceship' theme
# https://github.com/pascaldevink/spaceship-zsh-theme

echo "Installing 'Spaceship' theme for ohmyzsh"
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.zsh | zsh

