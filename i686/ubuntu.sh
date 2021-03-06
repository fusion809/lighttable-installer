#!/bin/bash

method

sudo apt-get install -y curl

if ! [[ -d $HOME/Programs ]]; then
  mkdir $HOME/Programs
fi

curl -sL http://mirror.optus.net/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_i386.deb > $HOME/Programs/libudev0_175-0ubuntu9_i386.deb
sudo dpkg -i $HOME/Programs/libudev0_175-0ubuntu9_i386.deb
sudo apt-get -f install

if [[ $preference == "A" ]]; then

  sudo apt-get install -y alsa-lib nss libgnome-keyring-dev fakeroot libgtk2.0-dev
  lighttable_binary

else

  ubuntu_build

fi
