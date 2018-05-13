# Install syntax highlight for zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install pure
git clone https://github.com/sindresorhus/pure.git ~/.pure
sudo ln -s "$HOME/.pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo ln -s "$HOME/.pure/async.zsh" /usr/local/share/zsh/site-functions/async

# Script for loading pure
cat >> ~/.zshenv <<EOM
# Pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="$"
prompt pure

EOM

echo "source $HOME/.zshenv" >> ~/.zshrc

# Execute zsh on opening
cat >> ~/.bashrc <<-EOM
if [ -t 1 ]; then
  exec zsh
fi
EOM

echo "Done. Please restart your terminal."

# Messages
echo <<-EOM
Then edit your ~/.zshrc to:
$ vi ~/.zshrc
  ZSH_THEME=""
  ...
  plugins=(
    [plugins...]
    zsh-syntax-highlighting
  )
EOM
