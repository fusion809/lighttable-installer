#!/bin/bash

. ./lib/lighttable-build.sh
. ./lib/test.sh

function lightin {
  cd /tmp/lighttable
  makepkg -si --noconfirm
  cd .
}

export -f lightin

# Install LightTable
function lightaur {

  # Export env variables
  export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
  export GIT=https://aur.archlinux.org/

  if comex yaourt; then                    # Install with yaourt if possible

    yaourt -S lighttable --noconfirm

  elif comex git; then                      # Install with git and makepkg otherwise

    git clone $GIT/lighttable.git /tmp/lighttable
    lightin

  elif comex curl; then                     # Install with curl and makepkg otherwise

    curl -sL $AUR/lighttable.tar.gz | tar xz -C /tmp
    lightin

  elif comex wget; then                     # Install with wget and makepkg otherwise

    wget -cqO- $AUR/lighttable.tar.gz | tar xz -C /tmp
    lightin

  else                                      # Install curl and install with curl and makepkg otherwise

    sudo pacman -S curl --noconfirm
    curl -sL $AUR/lighttable.tar.gz | tar xz -C /tmp
    lightin

  fi
}

export -f lightaur
