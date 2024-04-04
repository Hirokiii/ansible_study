#! /bin/bash

apt-get update && apt-get install -y openssh-server sudo
mkdir /var/run/sshd
useradd -m -s /bin/bash ${MY_USERNAME}
echo "${MY_USERNAME}:password" | chpasswd
adduser ${MY_USERNAME} sudo
mkdir -p /home/${MY_USERNAME}/.ssh
echo "${MY_SSH_KEY}" > /home/${MY_USERNAME}/.ssh/authorized_keys
chmod 700 /home/${MY_USERNAME}/.ssh
chmod 600 /home/${MY_USERNAME}/.ssh/authorized_keys
chown ${MY_USERNAME}:${MY_USERNAME} /home/${MY_USERNAME} -R
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
/usr/sbin/sshd -D