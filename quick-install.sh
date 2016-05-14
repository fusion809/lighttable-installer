#!/bin/bash

# This is a quick install script to install LightTable ASAP
export REPO=https://github.com/fusion809/lighttable-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/lighttable-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the lighttable-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/lighttable-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
    fi
  else
    printf "The lighttable-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if which git >/dev/null 2>&1; then
        cd $GHUBM/lighttable-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUBM/lighttable-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUBM/lighttable-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUBM/lighttable-installer
  ./installer.sh
else
  cd $GHUB

  if ! [[ -d $GHUB/lighttable-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the lighttable-installer repository locally ==>\n"
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/lighttable-installer
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
    fi
  else
    printf "The lighttable-installer repository is already locally present! "
    printf "\n"
    printf "Update your local copy? [y/n] "
    read yn
    if [[ $yn == "y" ]]; then
      if which git >/dev/null 2>&1; then
        cd $GHUB/lighttable-installer
        git pull origin master
        cd .
      elif which curl >/dev/null 2>&1; then
        rm -rf $GHUB/lighttable-installer
        curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
      elif which wget >/dev/null 2>&1; then
        rm -rf $GHUB/lighttable-installer
        wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
      fi
    else
      printf "Suit yourself!"
    fi

  fi

  cd $GHUB/lighttable-installer
  ./installer.sh
fi
