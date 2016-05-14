#!/bin/bash
function lighttable-binary {
  export pkgname=lighttable
  export pkgver=$(sed -n 's/pkgver=//p' /tmp/$pkgname/PKGBUILD)
  export _destdir="/opt/LightTable"
  export PRG="$HOME/Programs"
  export INSTALLER="https://github.com/fusion809/$pkgname-installer/raw/master/resources"

  printf "Where do you want to store the unpacked binary? [Leavy empty for $PRG] "
  read SRC_DEST

  printf "Do you want to install LightTable locally or system-wide? [local/system; default is system] "
  read $DEST_TYPE

  if [[ $DEST_TYPE == "local" ]]; then
    printf "Where do you want to install LightTable? [default is $SRC_DEST/builds/$pkgname-$pkgver-linux] "
    read $INST_DEST
    if [[ -n $INST_DEST ]]; then
      INST_DEST=$SRC_DEST/builds/$pkgname-$pkgver-linux
    fi
  fi

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$PRG
  fi

  if [[ $SRC_DEST == "$PRG" ]]; then
    mkdir $PRG
  fi

  if ! [[ -d /tmp/$pkgname ]]; then
    git clone https://aur.archlinux.org/$pkgname.git /tmp/$pkgname
  else
    cd /tmp/$pkgname
    git pull origin master
  fi

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

export -f lighttable-binary
