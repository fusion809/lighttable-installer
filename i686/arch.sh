#!/bin/bash

if comex lighttable; then                       # Check if LightTable is already installed

  printf "LightTable is already installed!"

else

  method

  if [[ $preference == "A" ]]; then
    lightaur
  else
    lighttable_build
  fi

fi
