#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo zypper in -y libgnome-keyring-devel gtk2-devel
  lighttable-binary

else

  opensuse-build

fi
