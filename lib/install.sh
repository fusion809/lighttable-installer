#!/bin/bash
function light_install {
  if [[ $DEST_TYPE == "local" ]]; then
    cp $INSTALLER/{$pkgname,$pkgname.png,$pkgname.desktop,LICENSE} $INST_DEST

    if ! [[ $INST_DEST == "$SRC_DEST/builds/$pkgname-$pkgver-linux" ]]; then
      sudo cp -a builds/$pkgname-$pkgver-linux/* $INST_DEST
    fi

    sed -i -e "s|/opt/LightTable|$INST_DEST|g" $INST_DEST/$pkgname.desktop
  else
    _destdir=/opt/LightTable
    sudo install -dm755 $_destdir
    sudo cp -a builds/$pkgname-$pkgver-linux/* $_destdir

    cp $INSTALLER/{$pkgname,$pkgname.png,$pkgname.desktop,LICENSE} $SRC_DEST

    sudo install -Dm 755 "$SRC_DEST/$pkgname" "/usr/bin/$pkgname"
    sudo install -dm755 "/usr/share/licenses/$pkgname"
    sudo install -Dm 644 "$SRC_DEST/LICENSE" "/usr/share/licenses/$pkgname/LICENSE"

    sudo install -Dm 644 "$SRC_DEST/$pkgname.desktop" "/usr/share/applications/$pkgname.desktop"
    sudo install -Dm 644 "$SRC_DEST/$pkgname.png" "/usr/share/pixmaps/$pkgname.png"
  fi
}

export -f light_install
