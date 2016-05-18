#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo zypper in -y libgnome-keyring-devel gtk2-devel
  ${lowedit}_binary

else

  opensuse_build

fi
