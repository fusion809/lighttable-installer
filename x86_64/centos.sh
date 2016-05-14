#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if [[ $preference == "A" ]]; then

  sudo yum install -y wget alsa-lib nss libgnome-keyring-devel gtk2-devel
  if ! [[ -f /usr/lib/libudev.so.0 ]]; then
    curl -OsL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.x86_64.rpm /tmp
    if ! `comex bsdtar`; then
      sudo yum install -y bsdtar
    fi
    bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm
    sudo cp -a /tmp/lib64/libudev.so.0* /usr/lib/
  fi
  lighttable-binary

else

  centos-build

fi