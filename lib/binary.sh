#!/bin/bash
function lighttable_binary {
  export pkgname=lighttable
  version $pkgname
  export _destdir="/opt/LightTable"
  export PRG="$HOME/Programs"
  export INSTALLER=$INDIR/resources

  dest $PRG

  wget -cqO- https://github.com/LightTable/LightTable/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz | tar xz -C $SRC_DEST
  light_install

}

export -f lighttable_binary
