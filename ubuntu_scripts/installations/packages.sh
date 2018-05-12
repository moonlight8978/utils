#! /bin/bash

echo "Installing important packages..."
sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update && sudo apt-get install -y \
  git \
  default-jdk
echo "Done."

echo "Setting up packages..."
cat >> ~/.bashrc <<-EOC
# Java
export JAVA_HOME="/usr/lib/jvm/default-java"

EOC
echo "Done."

echo "Installing fonts..."
sudo apt-get install \
  fonts-noto \
  fonts-noto-hinted \
  fonts-noto-mono \
  fonts-noto-unhinted \
  fonts-noto-cjk \
  fonts-powerline
echo "Done."
