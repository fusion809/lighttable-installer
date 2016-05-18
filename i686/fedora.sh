#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo dnf copr enable mosquito/lighttable
  sudo dnf update
  sudo dnf install -y lighttable

else

  fedora_build

fi
