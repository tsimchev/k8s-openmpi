#!/bin/bash

set -eu -o pipefail

# Update repository cache
apt-get update

apt-get install -y --no-install-recommends apt-utils

# Install packages
install_packages ca-certificates
echo N | install_packages ssh
install_packages wget
install_packages build-essential

OPENMPI_VERSION_MAJOR="$(cut -d '.' -f-2 <<< $OPENMPI_VERSION)"
OPENMPI_FOLDER="openmpi-${OPENMPI_VERSION}"
OPENMPI_BUNDLE="${OPENMPI_FOLDER}.tar.gz"
OPENMPI_URL="https://download.open-mpi.org/release/open-mpi/v${OPENMPI_VERSION_MAJOR}/${OPENMPI_BUNDLE}"

cd /tmp
wget ${OPENMPI_URL}
tar -xzf ${OPENMPI_BUNDLE}
cd ${OPENMPI_FOLDER}

./configure --prefix=/usr
make
make install

cd /tmp
rm -r ${OPENMPI_FOLDER} ${OPENMPI_BUNDLE}