# BornToBeRoot

> A hands‑on Linux hardening & services setup project — inspired by the 42 born2beroot exercise.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Repo size](https://img.shields.io/github/repo-size/medob6/BornToBeRoot)](https://github.com/medob6/BornToBeRoot)
[![Language](https://img.shields.io/github/languages/top/medob6/BornToBeRoot)](https://github.com/medob6/BornToBeRoot)

Table of Contents
- About
- Project Goals
- Requirements
- Quickstart (VM / Host setup)
- Tasks & Checklist
- Testing & Validation
- Repository Layout
- Contributing
- License
- Authors / Acknowledgements

---

## About
BornToBeRoot is a practical learning repository that walks you through provisioning, hardening, and configuring a minimal Linux environment so it becomes production-ready (and secure). This project is inspired by common "born2beroot" exercises (notably @ayoub0x1/born2beroot): install a base system, configure essential services, apply security best practices, and verify the result.

Use this repo to:
- Learn how to install and configure core Linux services (SSH, HTTP, FTP, DB, cron)
- Practice system hardening and user management
- Automate repetitive setup steps with scripts and/or Ansible
- Validate configuration with checks and tests

## Project Goals
- Bootstrapped minimal Linux installation
- Proper users and groups with least privilege
- SSH configured securely (no root login; key-based auth)
- Essential services installed and configured (HTTP, FTP, MySQL/MariaDB)
- Automated tasks for repeatable environment creation
- Clear documentation and verification steps

## Requirements
- A virtual machine (recommended): VirtualBox / VMware / QEMU
- A Debian-based distribution (Ubuntu/Debian) — this repo assumes apt & systemd
- Bash, sudo, curl, wget on host/guest
- Optional: Ansible (if playbooks are provided)
- Recommended RAM: 1–2 GB, Disk: 10+ GB

## Quickstart

1. Clone the repository
```bash
git clone https://github.com/medob6/BornToBeRoot.git
cd BornToBeRoot
```

2. Boot a VM with Debian/Ubuntu and make sure networking is enabled.

3. Copy any provided setup scripts to the VM and run them as root (or run the included playbook):
```bash
# example: run a provided install script (if present)
sudo bash ./scripts/setup_vm.sh
```

4. If Ansible playbooks are available:
```bash
ansible-playbook -i inventory/hosts playbooks/setup.yml --ask-become-pass
```

Note: Filenames above are examples — replace them with actual scripts/playbooks in this repo.

## Tasks & Checklist
System & Users
- [ ] Create a non-root admin user with sudo privileges
- [ ] Disable direct root SSH login
- [ ] Configure password policies and user shells

SSH
- [ ] Deploy SSH keys for admin users
- [ ] Disable password authentication (optional)
- [ ] Change default SSH port (optional)

Services
- [ ] Install/configure OpenSSH
- [ ] Install/configure HTTP server (nginx/apache)
- [ ] Install/configure FTP server (vsftpd or similar)
- [ ] Install/secure DB server (MySQL/MariaDB)
- [ ] Ensure cron jobs run as expected

Networking & Firewall
- [ ] Configure UFW/iptables to allow only necessary ports
- [ ] Close unnecessary services and ports

Hardening
- [ ] Keep packages up to date
- [ ] Limit suid binaries
- [ ] Ensure correct permissions on sensitive files

Documentation & Automation
- [ ] Provide setup scripts or Ansible playbooks
- [ ] Provide a runbook explaining what was changed and why

## Testing & Validation

Manual checks (examples):
```bash
# check SSH status
sudo systemctl status ssh

# verify SSH listens on configured port
ss -tlnp | grep sshd

# check web server
curl -I http://localhost

# verify firewall rules
sudo ufw status verbose

# check for sudo user
getent passwd <username>
```

Automated tests (if included):
- If the repo contains a `checker/` or `tests/` script, run it:
```bash
sudo bash ./checker/check_my_vm.sh
```

## Repository Layout
- README.md — this file
- LICENSE
- scripts/ — one‑shot install scripts and helpers
- playbooks/ — Ansible playbooks (if any)
- configs/ — sample configuration files
- checker/ — validation / grading scripts
- docs/ — additional documentation and design notes

Please follow code style and document any automation you add.

## License
This project is provided under the MIT License — see the [LICENSE](LICENSE) file for details.
---
