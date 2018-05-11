#! bin/bash

sudo apt-get update && sudo apt-get install \
  git-core \
  curl \
  zlib1g-dev \
  build-essential \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libsqlite3-dev \
  sqlite3 \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  python-software-properties \
  libffi-dev \
  postgresql-client-common \
  postgresql-client \
  libpq-dev \
  imagemagick

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
cat >> ~/.zshenv <<EOM
# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

EOM
exec $SHELL

rbenv install 2.5.1
rbenv global 2.5.1

gem install bundler
gem install rails

rbenv rehash
