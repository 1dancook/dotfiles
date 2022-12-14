
# make sure we have the paths first
export PATH="$PATH:$HOME/.pyenv/shims"
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"

# mkdocs themes
pip install mkdocs-bootswatch
pip install mkdocs-cluster
pip install mkdocs-custommill
pip install mkdocs-gitbook
pip install mkdocs-github
pip install mkdocs-kpn
pip install mkdocs-material
pip install mkdocs-material-extensions
pip install mkdocs-windmill
pip install mkdocs-windmillex
