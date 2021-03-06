#!/bin/bash

method

sudo apt-get install -y curl

if ! [[ -d $HOME/Programs ]]; then
  mkdir $HOME/Programs
fi

curl -sL http://mirror.optus.net/ubuntu/pool/main/u/udev/libudev0_175-0ubuntu9_amd64.deb > $HOME/Programs/libudev0_175-0ubuntu9_amd64.deb
sudo dpkg -i $HOME/Programs/libudev0_175-0ubuntu9_amd64.deb
sudo apt-get -f install

if [[ $preference == "A" ]]; then

  sudo apt-get install -y alsa-lib nss libgnome-keyring-dev fakeroot libgtk2.0-dev
  ${lowedit}_binary

else

  if ! [[ -d $HOME/Programs ]]; then
    mkdir $HOME/Programs
  fi

  ubuntu_build

fi
