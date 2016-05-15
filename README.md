# LightTable Installer
<p><img src="/images/VirtualBox_Linux_Mint_17.3-LightTable.png" alt="LightTable 0.8.1 running on Linux Mint"><caption><b>Figure 1: LightTable 0.8.1 running on Linux Mint, which was installed using this very installer.</b></caption></p>
This repository contains a series of installer scripts for [LightTable IDE](http://www.lighttable.com) on Linux.

## Supported Distributions
It supports a wide variety of different Linux distributions, including:

* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://www.centos.org/)
* [Debian](https://www.debian.org/)
* [Fedora](https://getfedora.org/)
* [Mageia](http://www.mageia.org/en/)
* [Manjaro Linux](https://manjaro.github.io/)
* [openSUSE](https://www.opensuse.org/)
* [Sabayon Linux](http://www.sabayon.org/)
* [Ubuntu](http://www.ubuntu.com/) (and its major derivatives, including [Linux Mint](https://linuxmint.com/))

The way it detects the operating system it is being run on is by reading the `/etc/os-release` file. So, if you find that running `cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g'` returns the distribution names given above, your distribution should be supported by this installer.

## Use
It has a [`quick-install.sh`](/quick-install.sh) script that can be launched via running (assuming cURL is installed):

```bash
/bin/bash -c "$(curl -sL https://git.io/vr3pT)"
```

or (assuming wget is installed):

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vr3pT)"
```

## Contributing
For details on how to contribute to this project please see the [CONTRIBUTING.md](/CONTRIBUTING.md) file.

## License
The contents of this repository are licensed under the GNU GPLv3 license, found in [LICENSE](/LICENSE).
