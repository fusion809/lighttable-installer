#!/bin/bash
. ./lib/lighttable-build.sh

function debian-build {
  # Get dependencies
  sudo apt-get install -y curl
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential git \
    libgnome-keyring-dev fakeroot libgtk2.0-dev
  LightTable-build
}

export -f debian-build