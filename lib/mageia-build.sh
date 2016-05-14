#!/bin/bash
. ./lib/lighttable-build.sh
. ./lib/node-build.sh

function mageia-build {
  # Get dependencies
  sudo urpmi wget libgnome-keyring-devel make gcc gcc-c++ \
    libudev0-devel gtk2-devel
  node-build
  LightTable-build
}

export -f mageia-build
