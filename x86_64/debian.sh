#!/bin/bash

method

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  ARC=amd64
  curl -OsL http://ftp.au.debian.org/debian/pool/main/u/udev/libudev0_175-7.2_$ARC.deb
  sudo dpkg -i libudev0_175-7.2_$ARC.deb
  sudo apt-get -f install
  rm libudev0_175-7.2_$ARC.deb
fi

sudo apt-get install -y wget default-jre

if [[ $preference == "A" ]]; then

  sudo apt-get install -y alsa-lib nss libgnome-keyring-dev fakeroot libgtk2.0-dev
  lighttable_binary

else

  debian_build

fi
