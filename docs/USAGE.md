# Usage

Instructions to get started with BornToBeRoot.

1. Prepare a Debian/Ubuntu VM and enable networking.
2. Copy files from this repository to the VM or clone the repo directly.
3. Run the installer script as root:

```bash
sudo bash ./scripts/setup_vm.sh
```

4. After setup, add your SSH public key to /home/adminuser/.ssh/authorized_keys and verify access.
5. Run the checker to validate basic services:

```bash
sudo bash ./checker/check_my_vm.sh
```
