#!/usr/bin/env fish

echo "Checking if Homebrew is already installed..."; 

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! (which brew)
    echo "Installing Homebrew...";
    yes | /bin/bash -c "(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Homebrew is already installed...";
end

# Install the essential brews and casks from Brewfile
if test -e "Brewfile"
    echo "Installing brews and casks ...";
    brew bundle install -v
end

# Update and Upgrade
echo "Updating and upgrading Homebrew..."; echo;
yes | brew update
yes | brew upgrade

# Remove outdated versions from the cellar
brew cleanup