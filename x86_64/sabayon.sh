#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo equo i gnome-base/libgnome-keyring x11-libs/gtk+:2 virtual/jre:1.7
  ${lowedit}_binary

else

  sabayon_build

fi
