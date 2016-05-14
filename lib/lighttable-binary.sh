#!/bin/bash
function lighttable-binary {
  export PRG=$HOME/Programs
  printf "Where do you want to store the unpacked binary? [Leavy empty for $PRG] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$PRG
  fi
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable > $SRC_DEST/lighttable
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable.png > $SRC_DEST/lighttable.png
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable.desktop > $SRC_DEST/lighttable.desktop
  sudo install -Dm 755 "$SRC_DEST/lighttable" "/usr/bin/lighttable"

  install -dm755 "$pkgdir/usr/share/licenses/lighttable"
  install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/lighttable/LICENSE"

  _destdir="$pkgdir/opt/LightTable"

  install -dm755 $_destdir
  mv $srcdir/lighttable-${pkgver//_/-}-linux/* $_destdir

  install -Dm 644 "$srcdir/lighttable.desktop" "$pkgdir/usr/share/applications/lighttable.desktop"
  install -Dm 644 "$srcdir/lighttable.png" "$pkgdir/usr/share/pixmaps/lighttable.png"

}
