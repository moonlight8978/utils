#! /bin/bash

sudo add-apt-repository ppa:git-core/ppa

sudo apt-get update && sudo apt-get install -y \
  git \
  default-jdk

cat >> ~/.bashrc <<-EOC
# Java
export JAVA_HOME="/usr/lib/jvm/default-java"

EOC
