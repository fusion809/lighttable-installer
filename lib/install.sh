#!/bin/bash
function light-install {
  if [[ $DEST_TYPE == "local" ]]; then
    wget -cqO- $INSTALLER/$pkgname > $INST_DEST/$pkgname
    wget -cqO- $INSTALLER/$pkgname.png > $INST_DEST/$pkgname.png
    wget -cqO- $INSTALLER/$pkgname.desktop > $INST_DEST/$pkgname.desktop
    wget -cqO- $INSTALLER/LICENSE > $INST_DEST/LICENSE

    if ! [[ $INST_DEST == "$SRC_DEST/builds/$pkgname-$pkgver-linux" ]]; then
      sudo cp -a builds/$pkgname-$pkgver-linux/* $INST_DEST
    fi

    sed -i -e "s|/opt/LightTable|$INST_DEST|g" $INST_DEST/$pkgname.desktop
  else
    _destdir=/opt/LightTable
    sudo install -dm755 $_destdir
    sudo cp -a builds/$pkgname-$pkgver-linux/* $_destdir

    wget -cqO- $INSTALLER/$pkgname > $SRC_DEST/$pkgname
    wget -cqO- $INSTALLER/$pkgname.png > $SRC_DEST/$pkgname.png
    wget -cqO- $INSTALLER/$pkgname.desktop > $SRC_DEST/$pkgname.desktop
    wget -cqO- $INSTALLER/LICENSE > $SRC_DEST/LICENSE

    sudo install -Dm 755 "$SRC_DEST/$pkgname" "/usr/bin/$pkgname"
    sudo install -dm755 "/usr/share/licenses/$pkgname"
    sudo install -Dm 644 "$SRC_DEST/LICENSE" "/usr/share/licenses/$pkgname/LICENSE"

    sudo install -Dm 644 "$SRC_DEST/$pkgname.desktop" "/usr/share/applications/$pkgname.desktop"
    sudo install -Dm 644 "$SRC_DEST/$pkgname.png" "/usr/share/pixmaps/$pkgname.png"
  fi
}

export -f light-install
