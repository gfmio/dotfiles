#!/bin/bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

# Install formulae from file
# brew install wget

# Install casks from file
# brew install wget

# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
