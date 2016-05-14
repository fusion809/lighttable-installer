#!/bin/bash
. ./lib/lighttable-build.sh

function sabayon-build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc virtual/libstdc++ sys-libs/glibc \
    gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/gtk+:2 virtual/libudev #\
  #  sys-libs/libudev-compat
  if ! [[ -f /usr/lib/libudev.so.0 ]]; then
    sudo ln -s /usr/lib/libudev.so.1.* /usr/lib/libudev.so.0
  fi
  LightTable-build
}

export -f sabayon-build
