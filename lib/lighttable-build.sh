function LightTable-build {
  export GHUB=$HOME/GitHub

  # Get the source code
  printf "How would you like to get the source code? [curl/git/wget/?] "
  read SRC_METHOD

  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install Atom locally or system-wide? [local/system, default: system] "
  read DEST_TYPE

  if ! [[ -d /tmp/lighttable ]]; then
    git clone https://aur.archlinux.org/lighttable.git /tmp/lighttable
  else
    cd /tmp/lighttable
    git pull origin master
  fi
  ver=$(sed -n 's/pkgver=//p' /tmp/lighttable/PKGBUILD)

  if [[ $SRC_METHOD == "?" ]]; then

    printf "curl and wget are the fastest methods and they chew up less bandwidth.\n
    While git uses up more bandwidth but it also makes upgrading the package faster."

  elif [[ $SRC_METHOD == "curl" ]]; then

    if [[ -d $SRC_DEST/LightTable-$ver ]]; then
      rm -rf $SRC_DEST/LightTable-$ver
    fi
    curl -sL https://github.com/LightTable/LightTable/archive/$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/LightTable-$ver

  elif [[ $SRC_METHOD == "wget" ]]; then

    if [[ -d $SRC_DEST/LightTable-$ver ]]; then
      rm -rf $SRC_DEST/LightTable-$ver
    fi
    wget -cqO- https://github.com/LightTable/LightTable/archive/$ver.tar.gz | tar xz -C $SRC_DEST
    cd $SRC_DEST/LightTable-$ver

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
  curl -sL https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > $HOME/bin
  chmod +x $HOME/bin/lein
  export PATH=$PATH:$HOME/bin
  lein

  cd $SRC_DEST/LightTable
  script/build.sh
}

export -f LightTable-build