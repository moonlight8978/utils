#! bin/bash

sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update && sudo apt-get install -y \
  git \
  default-jdk
