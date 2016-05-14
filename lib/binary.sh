#!/bin/bash
function lighttable-binary {
  export pkgname=lighttable
  version $pkgname
  export _destdir="/opt/LightTable"
  export PRG="$HOME/Programs"
  export INSTALLER="https://github.com/fusion809/$pkgname-installer/raw/master/resources"

  dest $PRG

  wget -cqO- https://github.com/LightTable/LightTable/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz | tar xz -C $SRC_DEST
  light-install

}

export -f lighttable-binary
