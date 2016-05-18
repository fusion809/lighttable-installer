#!/bin/bash
function dest {
  printf "Where do you want to store the downloaded files? [Leave empty for $1] "
  read SRC_DEST

  printf "Do you want to install LightTable locally or system-wide? [local/system; default is local] "
  read DEST_TYPE

  if [[ $DEST_TYPE == "local" ]]; then
    printf "Where do you want to install LightTable? [default is $HOME/.local] "
    read INST_DEST

    if [[ -n $INST_DEST ]]; then
      INST_DEST=$HOME/.local
    fi

    if ! [[ -d $INST_DEST ]]; then
      mkdir -p $INST_DEST
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
