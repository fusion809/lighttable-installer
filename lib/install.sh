#!/bin/bash
function light_install {
  if [[ $DEST_TYPE == "local" ]]; then
    cp $INSTALLER/{$pkgname,$pkgname.png,$pkgname.desktop,LICENSE} $INST_DEST

    if ! [[ $INST_DEST == "$SRC_DEST/builds/$pkgname-$pkgver-linux" ]]; then
      sudo cp -a builds/$pkgname-$pkgver-linux/* $INST_DEST
    fi

    # Edit executing script
    sed -i -e "s|/opt/LightTable|$INST_DEST|g" $INST_DEST/$pkgname
    sed -i -e "s|<%-INST-%>|$INST_DEST|g" $INST_DEST/$pkgname.desktop

    # Create .local/share/applications directory, if it does not already exist
    if ! [[ -d $HOME/.local/share/applications ]]; then
      mkdir -p $HOME/.local/share/applications
    fi

    # Create .local/share/icons if need be
    if ! [[ -d $HOME/.local/share/icons ]]; then
      mkdir -p $HOME/.local/share/icons
    fi

    install -Dm755 $INST_DEST/$pkgname.desktop $HOME/.local/share/applications/$pkgname.desktop
    install -Dm755 $pkgname.png $HOME/.local/share/icons/$pkgname.png

  else
    _destdir=/opt/LightTable
    sudo install -dm755 $_destdir
    sudo cp -a builds/$pkgname-$pkgver-linux/* $_destdir

    cp $INSTALLER/{$pkgname,$pkgname.png,$pkgname.desktop,LICENSE} $SRC_DEST
    sed -i -e "s|<%-INST-%>|$_destdir|g" $pkgname.desktop

    sudo install -Dm 755 "$SRC_DEST/$pkgname" "/usr/bin/$pkgname"
    sudo install -dm755 "/usr/share/licenses/$pkgname"
    sudo install -Dm 644 "$SRC_DEST/LICENSE" "/usr/share/licenses/$pkgname/LICENSE"

    sudo install -Dm 644 "$SRC_DEST/$pkgname.desktop" "/usr/share/applications/$pkgname.desktop"
    sudo install -Dm 644 "$SRC_DEST/$pkgname.png" "/usr/share/pixmaps/$pkgname.png"
  fi
}

export -f light_install
