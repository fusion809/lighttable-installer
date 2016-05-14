#!/bin/bash
function LightTable-build {
  export pkgname=lighttable
  version $pkgname
  export _destdir=/opt/LightTable
  export GHUB="$HOME/GitHub"
  export INSTALLER="https://github.com/fusion809/$pkgname-installer/raw/master/resources"

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  dest $GHUB

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

  # Install it
  light-install
}

export -f LightTable-build
