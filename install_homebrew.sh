# Install Homebrew
# requires xcode command line tools first

echo "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# update path

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Update homebrew
brew update
