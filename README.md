# BornToBeRoot

> A hands‑on Linux hardening & services setup project.

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
BornToBeRoot is a practical learning repository that walks you through provisioning, hardening, and configuring a minimal Linux environment so it becomes production-ready (and secure). Use this repo to learn how to install and configure core Linux services, practice system hardening and user management, automate setup steps, and validate configurations.

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

3. Run the installer script on the VM (example):
```bash
sudo bash ./scripts/setup_vm.sh
```

4. Or run the Ansible playbook from a control machine:
```bash
ansible-playbook -i inventory/hosts playbooks/setup.yml --ask-become-pass
```

## Tasks & Checklist
- [ ] Create a non-root admin user with sudo privileges
- [ ] Disable direct root SSH login
- [ ] Configure password policies and user shells
- [ ] Deploy SSH keys for admin users
- [ ] Install and configure OpenSSH, HTTP, FTP, and DB services
- [ ] Configure firewall rules to allow only necessary ports
- [ ] Provide setup scripts or Ansible playbooks
- [ ] Provide a checker script to validate the configuration

## Testing & Validation
Manual checks (examples):
```bash
sudo systemctl status ssh
ss -tlnp | grep sshd
curl -I http://localhost
sudo ufw status verbose
getent passwd <username>
```

Automated checks (if included):
```bash
sudo bash ./checker/check_my_vm.sh
```

## Repository Layout
- README.md — this file
- LICENSE
- scripts/ — install scripts and helpers
- playbooks/ — Ansible playbooks
- configs/ — sample configuration files
- checker/ — validation scripts
- docs/ — documentation and usage notes

## Contributing
Contributions, issues, and feature requests are welcome.
- Fork the repo
- Create a feature branch
- Add tests or documentation for new features
- Open a PR with a clear description

## License
This project is provided under the MIT License — see the [LICENSE](LICENSE) file for details.

## Authors / Acknowledgements
- medob6 — repository owner
