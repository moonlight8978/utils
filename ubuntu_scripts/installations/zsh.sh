#! /bin/bash

# Install zsh
echo "Installing zsh..."
sudo apt-get update && sudo apt-get install \
  curl \
  zsh
echo "Done."

# Set zsh to default shell and install OMZ
echo "Setting up zsh..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
