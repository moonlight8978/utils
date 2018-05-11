cat >> ~/.zshenv <<EOM
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pure
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="$"
prompt pure

# Java
export JAVA_HOME="/usr/lib/jvm/default-java"
EOM

echo "source $HOME/.zshenv" >> ~/.zshrc
