#!/usr/bin/env bash

# update before continuing
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names #there is an error for --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri #there is an error for --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install gs
brew install lua
brew install p7zip
brew install pigz
brew install pv
brew install rlwrap
#brew install ssh-copy-id
brew install vbindiff
brew install zopfli


# Other things I have used before
brew install aspell
brew install bat
brew install cmake
brew install gnutls
brew install ffmpeg
brew install cmus
brew install curl
brew install enca
brew install exa
brew install tree # needed for exa -T
brew install translate-shell # trans -> https://www.soimort.org/translate-shell/
brew install fd
brew install gcc
brew install fzf
brew install gnuplot
brew install graphviz
brew install gron
brew install hledger
brew install ncurses
brew install htop
brew install btop # https://github.com/aristocratos/btop
brew install httpie
brew install hub
brew install imagemagick --with-webp
brew install jq
brew install openssl
brew install mitmproxy
brew install yt-dlp
brew install mpv
brew install mtr
brew install ncdu
brew install neovim
brew install nnn
brew install node
brew install pandoc
brew install homebrew/cask/basictex    # see install instructions for pandoc https://pandoc.org/installing.html#macos
brew install qrencode
brew install rename
brew install ripgrep
brew install ruby
#brew install sc-im
brew install --HEAD sc-im --build-from-source
brew install sox
brew install stow
brew install task
brew install taskd
brew install tasksh
brew install tmux
brew install tor
#brew install unrar # no formula
brew install unrtf
brew install w3m
brew install youtube-dl
brew install html-xml-utils # https://www.w3.org/Tools/HTML-XML-utils/
brew install --cask wkhtmltopdf # https://formulae.brew.sh/cask/wkhtmltopdf https://wkhtmltopdf.org/ # requires password to install
brew install gh #github cli
brew install entr # https://github.com/eradman/entr  run commands on file changes

# Remove outdated versions from the cellar.
brew cleanup
