#!/bin/bash

set -eu -o pipefail

OPENMPI_USER="$(ls -1 /home)"
OPENMPI_USER_HOME=/home/$OPENMPI_USER
OPENMPI_UID=1337
OPENMPI_GID=1337

# SSH setup host
cp /etc/ssh/key/id_rsa* /etc/ssh/
chmod 600 /etc/ssh/id_rsa
chmod 644 /etc/ssh/id_rsa.pub

# SSH setup client
cat >> /etc/ssh/ssh_config << SSH_CONFIG
CanonicalizeHostname yes
CanonicalDomains $(hostname -d)
SSH_CONFIG

mkdir -p ${OPENMPI_USER_HOME}/.ssh
# TODO - need rework. Docker filesystem issue - https://github.com/docker/for-linux/issues/433
cp /etc/ssh/id_rsa* ${OPENMPI_USER_HOME}/.ssh
cp /etc/ssh/id_rsa.pub ${OPENMPI_USER_HOME}/.ssh/authorized_keys
chmod -R 0700 ${OPENMPI_USER_HOME}/.ssh 
chmod 0644 ${OPENMPI_USER_HOME}/.ssh/id_rsa.pub
chmod 0644 ${OPENMPI_USER_HOME}/.ssh/authorized_keys
chown -R ${OPENMPI_UID}:${OPENMPI_GID} ${OPENMPI_USER_HOME}/.ssh

# Terminate when SSHD terminates
# TODO - this has to be replaces by the upper layer application
/usr/sbin/sshd -D