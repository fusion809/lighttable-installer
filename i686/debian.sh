#!/bin/bash
printf "Do you want to install LightTable from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  ARC=i686
  curl -OsL http://ftp.au.debian.org/debian/pool/main/u/udev/libudev0_175-7.2_$ARC.deb
  sudo dpkg -i libudev0_175-7.2_$ARC.deb
  sudo apt-get -f install
  rm libudev0_175-7.2_$ARC.deb
fi

sudo apt-get install -y wget default-jre

if [[ $preference == "A" ]]; then

  sudo apt-get install -y alsa-lib nss libgnome-keyring-dev fakeroot libgtk2.0-dev
  lighttable-binary

else

  debian-build

fi
