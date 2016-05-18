#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo urpmi wget libgnome-keyring-devel libudev0-devel gtk2-devel
  lighttable_binary

else

  mageia_build

fi
