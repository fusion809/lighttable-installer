#!/bin/bash

if comex lighttable; then                       # Check if LightTable is already installed

  printf "LightTable is already installed!"

else

  printf "Would you rather install LightTable from: A) a binary tarball (faster) or B) from source (slower)? [A/B; B is the default] "
  read preference

  if [[ $preference == "A" ]]; then
    lightaur
  else
    lighttable-build
  fi

fi
