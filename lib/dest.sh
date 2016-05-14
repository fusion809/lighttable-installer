#!/bin/bash
function dest {
  printf "Where do you want to store the downloaded files? [Leave empty for $1] "
  read SRC_DEST

  printf "Do you want to install LightTable locally or system-wide? [local/system; default is system] "
  read DEST_TYPE

  if [[ $DEST_TYPE == "local" ]]; then
    printf "Where do you want to install LightTable? [default is $SRC_DEST/builds/$pkgname-$pkgver-linux] "
    read INST_DEST

    if [[ -n $INST_DEST ]]; then
      INST_DEST=$SRC_DEST/builds/$pkgname-$pkgver-linux
    fi

    export INST_DEST
  fi

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$1
  fi

  export SRC_DEST
  export DEST_TYPE
}

export -f dest
