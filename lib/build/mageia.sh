#!/bin/bash
. ./lib/build/lighttable.sh
. ./lib/build/node.sh

function mageia_build {
  # Get dependencies
  sudo urpmi wget libgnome-keyring-devel make gcc gcc-c++ \
    libudev0-devel gtk2-devel
  node_build
  LightTable_build
}

export -f mageia_build
