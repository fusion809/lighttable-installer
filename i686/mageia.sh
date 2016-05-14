#!/bin/bash
printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if [[ $preference == "A" ]]; then

  sudo urpmi wget libgnome-keyring-devel libudev0-devel gtk2-devel
  lighttable-binary

else

  mageia-build

fi
