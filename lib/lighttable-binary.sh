#!/bin/bash
function lighttable-binary {
  export PRG=$HOME/Programs
  printf "Where do you want to store the unpacked binary? [Leavy empty for $PRG] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$PRG
  fi

  if ! [[ -d /tmp/lighttable ]]; then
    git clone https://aur.archlinux.org/lighttable.git /tmp/lighttable
  else
    cd /tmp/lighttable
    git pull origin master
  fi
  pkgname=lighttable
  pkgver=$(sed -n 's/pkgver=//p' /tmp/lighttable/PKGBUILD)
  _destdir="/opt/LightTable"

  wget -cqO- https://github.com/LightTable/LightTable/releases/download/$ver/$pkgname-$pkgver-linux.tar.gz | tar xz -C $SRC_DEST

  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable > $SRC_DEST/lighttable
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable.png > $SRC_DEST/lighttable.png
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/lighttable.desktop > $SRC_DEST/lighttable.desktop
  wget -cqO- https://github.com/fusion809/lighttable-installer/raw/master/LICENSE > $SRC_DEST/LICENSE

  sudo install -Dm 755 "$SRC_DEST/lighttable" "/usr/bin/lighttable"
  sudo install -dm755 "/usr/share/licenses/lighttable"
  sudo install -Dm 644 "$SRC_DEST/LICENSE" "/usr/share/licenses/lighttable/LICENSE"

  sudo install -dm755 $_destdir
  sudo mv $SRC_DEST/lighttable-${pkgver//_/-}-linux/* $_destdir

  sudo install -Dm 644 "$SRC_DEST/lighttable.desktop" "/usr/share/applications/lighttable.desktop"
  sudo install -Dm 644 "$SRC_DEST/lighttable.png" "/usr/share/pixmaps/lighttable.png"

}

export -f lighttable-binary
