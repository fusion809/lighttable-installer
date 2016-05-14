#!/bin/bash

method

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  curl -sL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.x86_64.rpm > /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm
  if ! `comex bsdtar`; then
    sudo yum install -y bsdtar
  fi
  bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm -C /tmp
  sudo cp -a /tmp/lib64/libudev.so.0* /usr/lib/
fi

if [[ $preference == "A" ]]; then

  sudo yum install -y wget alsa-lib nss libgnome-keyring-devel gtk2-devel
  lighttable-binary

else

  centos-build

fi
