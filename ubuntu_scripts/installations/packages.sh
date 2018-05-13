#! /bin/bash

# Git
sudo add-apt-repository ppa:git-core/ppa

# Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Elasticsearch
curl -sS https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

# Install
sudo apt-get update && sudo apt-get install -y \
  git \
  default-jdk \
  elasticsearch

sudo apt-get install --no-install-recommends yarn

# Environment Variables
cat >> ~/.bashrc <<-EOC
# Java
export JAVA_HOME="/usr/lib/jvm/default-java"

EOC

# Done
echo "OK."
