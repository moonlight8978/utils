#! /bin/bash

echo "Installing zsh..."
sudo apt-get update && sudo apt-get install zsh
echo "Done."

echo "Setting up zsh..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
