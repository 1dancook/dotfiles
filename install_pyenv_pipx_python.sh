# INSTALL PYTHON with PIPENV
# https://github.com/pyenv/pyenv
echo "Installing pyenv via Homebrew"
brew install pyenv


echo "Installing python via pyenv"
# below will install 3.10's most recent version
pyenv install 3.11
pyenv global 3.11

# Below commands are for setting up env variables properly in SHELL

# TODO: echo the env stuff into a .local.env file instead
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
#echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
#echo 'eval "$(pyenv init -)"' >> ~/.zshrc

export PATH="$PATH:$HOME/.pyenv/shims"
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"

# INSTALL PIPX via HOMEBREW
# https://pypa.github.io/pipx/installation/
echo "Installing pipx via Homebrew"
brew install pipx
pipx ensurepath


# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -
