printf "Do you want to install Brackets from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is the default] "
read preference

if [[ $preference == "A" ]]; then

  sudo dnf copr enable mosquito/lighttable
  sudo dnf update
  sudo dnf install -y lighttable

else

  fedora-build

fi
