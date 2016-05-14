#!/bin/bash
function version {
  if ! [[ -d /tmp/$1 ]]; then
    git clone https://aur.archlinux.org/$1.git /tmp/$1
  else
    cd /tmp/$1
    git pull origin master
  fi
  
  export pkgver=$(sed -n 's/pkgver=//p' /tmp/$1/PKGBUILD)
}

export -f version
