#!/bin/bash
. ./lib/lighttable-build.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y unzip nodejs-devel gcc gcc-c++ make \
    glibc-devel git-core gtk2-devel python libgnome-keyring-devel
  lighttable-build
}
