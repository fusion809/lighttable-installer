#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo urpmi wget libgnome-keyring-devel libudev0-devel gtk2-devel
  lighttable-binary

else

  mageia-build

fi
