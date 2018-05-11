#! bin/bash

echo "Installing zsh..."
sudo apt-get update && sudo apt-get install zsh
echo "Done."

echo "Setting up zsh..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/sindresorhus/pure.git ~/.pure
sudo ln -s "$HOME/.pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo ln -s "$HOME/.pure/async.zsh" /usr/local/share/zsh/site-functions/async

cat >> ~/.bashrc <<-EOM
if [ -t 1 ]; then
  exec zsh
fi
EOM
echo "Done. Please restart your terminal."

echo <<-EOM
Please edit your ~/.zshrc to:
  ZSH_THEME=""
  ...
  plugins=(
    [plugins...]
    zsh-syntax-highlighting
  )
EOM

exec /usr/bin/zsh
