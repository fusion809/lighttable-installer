#!/bin/bash
printf "Do you want to install LightTable from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if [[ $preference == "A" ]]; then

  sudo equo i gnome-base/libgnome-keyring x11-libs/gtk+:2 virtual/jre:1.7
  lighttable-binary

else

  sabayon-build

fi
