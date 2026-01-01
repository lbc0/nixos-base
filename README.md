# nixos-lbc
## Partition scheme:
```
sudo -i
lsblk
cfdisk /dev/vda
```
- gpt labels: 1G type: EFI, 4G type: swap, remaining space, type: Linux Filesystem
```
mkfs.ext4 -L nixos /dev/vda3
mkswap -L swap /dev/vda2
mkfs.fat -F 32 -n boot /dev/vda1
```
- Mount the partitions:
```
mount /dev/vda3 /mnt
mount --mkdir /dev/vda1 /mnt/boot
swapon /dev/vda2
lsblk ## check
```

## Generate the NexOS config files:
```
nixos-generate-config --root /mnt
cd /mnt/etc/nixos/
```
## Clone the rest from this repo:
```git clone https://github.com/lbc0/nixos-base.git```
### Verrify the version!!!

# Install NixOS:
```
nixos-install --flake /mnt/etc/nixos#lbc
# Enter the root password
nixos-enter --root /mnt -c 'passwd lbc' #add password for the user
reboot

# If their is an issue, add the "no-write" option: (nixos-install --flake /mnt/etc/nixos#nixos-lbc --no-write-lock-file)
```
# Dotfiles
```
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub # Copy the public key and add it to your Github
git clone https://github.com/lbc0/nixos-lbc.git ~/ # Clone the other repo!
cp /etc/nixos/hardware-configuration.nix ~/nixos-lbc/ # Copy the hardware configurations

# verify the ownership: sudo chown -R lbc:users ~/nixos-lbc 
```

# Rebuild
```sudo nixos-rebuild switch --flake ~/nixos-lbc#lbc```





