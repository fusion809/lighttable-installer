#!/bin/bash
. ./lib/build/lighttable.sh

function fedora-build {
  # Get dependencies
  sudo dnf copr enable nibbler/nodejs
  sudo dnf update -y
  sudo dnf install -y unzip nodejs-devel npm gcc gcc-c++ make \
    glibc-devel git-core gtk2-devel
  LightTable-build
}

export -f fedora-build
