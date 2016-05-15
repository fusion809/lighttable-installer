#!/bin/bash
. ./lib/build/lighttable.sh

function sabayon-build {
  # Get dependencies
  sudo equo i net-libs/nodejs sys-devel/base-gcc sys-devel/gcc virtual/libstdc++ sys-libs/glibc \
    gnome-base/gnome-keyring gnome-base/libgnome-keyring x11-libs/gtk+:2 sys-libs/libudev-compat
  LightTable-build
}

export -f sabayon-build
