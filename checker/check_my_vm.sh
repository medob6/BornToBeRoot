#!/usr/bin/env bash
set -euo pipefail

echo "Running basic checks for BornToBeRoot setup"

# Check admin user
if id -u adminuser >/dev/null 2>&1; then
  echo "[OK] adminuser exists"
else
  echo "[FAIL] adminuser missing"
fi

# SSHd config
if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config 2>/dev/null; then
  echo "[OK] SSH root login disabled"
else
  echo "[WARN] SSH root login not disabled"
fi

# Services
for svc in ssh nginx mariadb ufw; do
  if systemctl is-active --quiet $svc; then
    echo "[OK] $svc is running"
  else
    echo "[FAIL] $svc is not running"
  fi
done

# Firewall
if ufw status | grep -q "Status: active"; then
  echo "[OK] UFW active"
else
  echo "[WARN] UFW not active"
fi
