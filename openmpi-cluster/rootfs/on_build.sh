#!/bin/bash

set -eu -o pipefail

# Create OpenMPI user

OPENMPI_USER=openmpi
OPENMPI_USER_HOME=/home/$OPENMPI_USER
OPENMPI_UID=1337
OPENMPI_GID=1337
addgroup --gid $OPENMPI_GID $OPENMPI_USER
adduser --uid $OPENMPI_UID --gid $OPENMPI_GID $OPENMPI_USER --gecos "" --disabled-password --home $OPENMPI_USER_HOME

# TODO - move to app container
install_packages git
cd ${OPENMPI_USER_HOME}

git clone https://github.com/intel/mpi-benchmarks.git
cd mpi-benchmarks

export CC=mpicc CXX=mpic++ CFLAGS="-lm -m64" CXXFLAGS="-lm -m64" FFLAGS="-lm -m64" FCFLAGS="lm -m64"
make clean
make all

chown -R ${OPENMPI_UID}:${OPENMPI_GID} ${OPENMPI_USER_HOME}/mpi-benchmarks
