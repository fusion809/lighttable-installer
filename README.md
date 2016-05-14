# LightTable Installer
This repository contains a series of installer scripts for [LightTable IDE](http://www.lighttable.com) on Linux. It supports a wide variety of different Linux distributions, including:

* [Arch Linux](https://www.archlinux.org)
* [CentOS](https://www.centos.org/)
* [Debian](https://www.debian.org/)
* [Fedora](https://getfedora.org/)
* [Mageia](http://www.mageia.org/en/)
* [Manjaro Linux](https://manjaro.github.io/)
* [openSUSE](https://www.opensuse.org/)
* [Sabayon Linux](http://www.sabayon.org/)
* [Ubuntu](http://www.ubuntu.com/) (and its major derivatives, including [Linux Mint](https://linuxmint.com/))

It has a [`quick-install.sh`](/quick-install.sh) script that can be launched via running (assuming cURL is installed):

```bash
/bin/bash -c "$(curl -sL https://git.io/vr3pT)"
```

or (assuming wget is installed):

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vr3pT)"
```

## License
The contents of this repository are licensed under the GNU GPLv3 license, found in [LICENSE.md](/LICENSE.md). The [LICENSE](/LICENSE) file pertains to LightTable, not to the installer.
