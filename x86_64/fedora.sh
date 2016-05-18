#!/bin/bash

method

if [[ $preference == "A" ]]; then

  sudo dnf copr enable mosquito/${lowedit}
  sudo dnf update
  sudo dnf install -y ${lowedit}

else

  fedora_build

fi
