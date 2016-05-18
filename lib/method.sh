#!/bin/bash

function method {
  printf "Would you rather install LightTable from: A) a binary tarball (faster, also safer) or B) from source (slower)? [A/B; B is the default] "
  read method
}

export -f method
