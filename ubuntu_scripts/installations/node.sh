#! /bin/bash

# echo "Installing NodeJS..."
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
cat >> ~/.zshenv <<-EOM
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

EOM
echo <<-EOM
Please restart terminal then install node
$ nvm install <version>
  version: lts/carbon, etc...
EOM
