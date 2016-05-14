#!/bin/bash
function LightTable-build {
  export pkgname=lighttable
  export pkgver=$(sed -n 's/pkgver=//p' /tmp/$pkgname/PKGBUILD)
  export _destdir=/opt/LightTable
  export GHUB="$HOME/GitHub"
  export INSTALLER="https://github.com/fusion809/$pkgname-installer/raw/master/resources"

  if ! [[ -d /tmp/$pkgname ]]; then
    git clone https://aur.archlinux.org/$pkgname.git /tmp/$pkgname
  else
    cd /tmp/$pkgname
    git pull origin master
  fi

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install LightTable locally or system-wide? [local/system; default is system] "
  read $DEST_TYPE

  if [[ $DEST_TYPE == "local" ]]; then
    printf "Where do you want to install LightTable? [default is $SRC_DEST/builds/$pkgname-$pkgver-linux] "
    read $INST_DEST
    if [[ -n $INST_DEST ]]; then
      INST_DEST=$SRC_DEST/builds/$pkgname-$pkgver-linux
    fi
  fi

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "curl" ]]; then

    if [[ -d $SRC_DEST/LightTable-$pkgver ]]; then
      rm -rf $SRC_DEST/LightTable-$pkgver
    fi
    curl -sL https://github.com/LightTable/LightTable/archive/$pkgver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/LightTable-$pkgver

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/LightTable-$pkgver ]]; then
      rm -rf $SRC_DEST/LightTable-$pkgver
    fi
    wget -cqO- https://github.com/LightTable/LightTable/archive/$pkgver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/LightTable-$pkgver

  elif [[ $SRC_METHOD == "git" ]]; then
    if ! [[ -d $SRC_DEST/LightTable ]]; then
      git clone https://github.com/LightTable/LightTable $SRC_DEST/LightTable
    fi
    cd $SRC_DEST/LightTable
    git fetch -p
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

  else

    printf "You must select a SRC_METHOD!"

  fi

  if ! [[ -d $HOME/bin ]]; then
    mkdir -p $HOME/bin
  fi
  curl -sL https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $HOME/bin/lein
  chmod +x $HOME/bin/lein
  export PATH=$PATH:$HOME/bin
  lein

  # Build LightTable
  cd $SRC_DEST/LightTable-$pkgver
  script/build.sh

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

export -f LightTable-build
