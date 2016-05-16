#!/bin/bash

# This is a quick install script to install LightTable ASAP
export REPO=https://github.com/fusion809/lighttable-installer
export GHUB=$HOME/GitHub
export GHUBM=$HOME/GitHub/mine

if ! [[ -d $GHUB ]]; then
  mkdir $GHUB
fi

###########################################################################################################################################
# Get the lighttable-installer repo if not present and update it, if not.
if [[ -d $GHUBM ]]; then
  cd $GHUBM

  if ! [[ -d $GHUBM/lighttable-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the lighttable-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUBM/lighttable-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
    fi
  else
    printf "Updating your local copy of lighttable-installer. ==>\n"
    ## git
    if [[ -d $GHUBM/lighttable-installer/.git ]]; then
      cd $GHUBM/lighttable-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUBM/lighttable-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUBM/lighttable-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUBM
    fi

  fi

else
  cd $GHUB

  if ! [[ -d $GHUB/lighttable-installer ]]; then                                                  # Get the repository, if necessary
    printf "Getting the lighttable-installer repository locally. ==>\n"

    ## git
    if which git >/dev/null 2>&1; then
      git clone $REPO $GHUB/lighttable-installer

    ## cURL
    elif which curl >/dev/null 2>&1; then
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
    fi
  else
    printf "Updating your local copy of lighttable-installer. ==>\n"

    ## git
    if [[ -d $GHUB/lighttable-installer/.git ]]; then
      cd $GHUB/lighttable-installer
      git pull origin master
      cd .

    ## cURL
    elif which curl >/dev/null 2>&1; then
      rm -rf $GHUB/lighttable-installer
      curl -sL $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB

    ## wget
    elif which wget >/dev/null 2>&1; then
      rm -rf $GHUB/lighttable-installer
      wget -cqO- $REPO/archive/master.tar.gz | tar xz --transform=s/lighttable-installer-master/lighttable-installer/ -C $GHUB
    fi
  fi

fi
###########################################################################################################################################

# Run the main installer script
if [[ -d $GHUB/lighttable-installer ]]; then
  cd $GHUB/lighttable-installer
  ./installer.sh
elif [[ -d $GHUBM/lighttable-installer ]]; then
  cd $GHUBM/lighttable-installer
  ./installer.sh
fi
