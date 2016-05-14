#!/bin/bash
printf "Do you want to install LightTable from A) a binary package (faster) or would you prefer B) a source install (slower)? [A/B; B is default] "
read preference

if ! [[ -f /usr/lib/libudev.so.0 ]]; then
  curl -sL ftp://195.220.108.108/linux/centos/6.7/updates/x86_64/Packages/libudev-147-2.63.el6_7.1.x86_64.rpm > /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm
  if ! `comex bsdtar`; then
    sudo yum install -y bsdtar
  fi
  bsdtar -xf /tmp/libudev-147-2.63.el6_7.1.x86_64.rpm -C /tmp
  sudo cp -a /tmp/lib64/libudev.so.0* /usr/lib/
fi


if [[ $preference == "A" ]]; then

  cd /etc/yum.repos.d/
  wget -cqO- https://copr.fedorainfracloud.org/coprs/mosquito/lighttable/repo/epel-7/mosquito-lighttable-epel-7.repo > /tmp/mosquito-lighttable-epel-7.repo
  sudo mv /tmp/mosquito-lighttable-epel-7.repo /etc/yum.repos.d/
  sudo yum update
  sudo yum install -y lighttable
  cd -

else

  centos-build

fi
