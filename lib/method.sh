#!/bin/bash

function method {
  printf "Would you rather install LightTable from: \nA) a binary tarball (faster, also safer) \nor \nB) from source (slower)? \n[Options: A/B. If you do not select one but press the Enter key, B will be automatically selected.]\n"
  read method
}

export -f method
