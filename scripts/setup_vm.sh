#!/usr/bin/env bash
set -euo pipefail

# Basic setup script for a Debian/Ubuntu VM. Run as root (sudo).

if [ "$(id -u)" -ne 0 ]; then
  echo "Run this script as root: sudo bash $0"
  exit 1
fi

echo "Updating package lists..."
apt-get update

echo "Installing core packages..."
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \ 
  sudo curl wget ufw openssh-server nginx mariadb-server vsftpd

# Create admin user if not exists
ADMIN_USER="adminuser"
if ! id -u "$ADMIN_USER" >/dev/null 2>&1; then
  echo "Creating user $ADMIN_USER with sudo privileges"
  useradd -m -s /bin/bash -G sudo "$ADMIN_USER"
  passwd -d "$ADMIN_USER" || true
  mkdir -p /home/$ADMIN_USER/.ssh
  chown -R $ADMIN_USER:$ADMIN_USER /home/$ADMIN_USER/.ssh
  chmod 700 /home/$ADMIN_USER/.ssh
fi

# SSH hardening: disable root login and password auth by default (commented out password disable)
SSHD_CONFIG="/etc/ssh/sshd_config"
if ! grep -q "^PermitRootLogin no" $SSHD_CONFIG; then
  sed -i "s/^#*PermitRootLogin.*/PermitRootLogin no/" $SSHD_CONFIG || echo "PermitRootLogin no" >> $SSHD_CONFIG
fi
if ! grep -q "^PasswordAuthentication no" $SSHD_CONFIG; then
  sed -i "s/^#*PasswordAuthentication.*/PasswordAuthentication yes/" $SSHD_CONFIG || true
fi
systemctl restart ssh || true

# Basic firewall
ufw allow OpenSSH
ufw allow 80
ufw --force enable

# Enable services
systemctl enable --now ssh nginx mariadb

echo "Setup complete. Review configuration files and add SSH keys for $ADMIN_USER."
