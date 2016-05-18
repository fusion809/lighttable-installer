#!/bin/bash

if comex $lowedit; then                       # Check if LightTable is already installed

  printf "$EDIT is already installed!"

else

  method

  if [[ $preference == "A" ]]; then
    lightaur
  else
    ${lowedit}_build
  fi

fi
