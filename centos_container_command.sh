#! /bin/bash

yum update -y && yum install -y openssh-server sudo
mkdir -p /var/run/sshd
useradd -m -s /bin/bash ${MY_USERNAME}
echo "${MY_USERNAME}:password" | chpasswd
usermod -aG wheel ${MY_USERNAME}
mkdir -p /home/${MY_USERNAME}/.ssh
echo "${MY_SSH_KEY}" > /home/${MY_USERNAME}/.ssh/authorized_keys
chmod 700 /home/${MY_USERNAME}/.ssh
chmod 600 /home/${MY_USERNAME}/.ssh/authorized_keys
chown ${MY_USERNAME}:${MY_USERNAME} /home/${MY_USERNAME} -R
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''
/usr/sbin/sshd -D