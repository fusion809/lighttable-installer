printf "Hi, you have opted for the in-built help of this repository.\n"
printf 'If you run the `installer.sh` script, without options (i.e., by running `./installer.sh`)
it should install LightTable for you. The algorithm it goes through to install LightTable is:

1. If possible it will install LightTable from one of the pre-compiled binaries provided by the
LightTable team. It will prompt you before doing this and ask you if you would prefer to install
LightTable from the available binary or from source code.

2. If a binary package exists for LightTable in an official repository of the distribution being used
it will install LightTable from it.

3. If option 1 or 2 are not possible, or if you opted to install LightTable from source code it will
run the `./lib/lighttable-build.sh` script after installing any missing build/runtime dependencies
for LightTable

Note it will NOT install LightTable from unofficial binaries or repositories.'
