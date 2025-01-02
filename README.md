### Dotfiles configured with YADM

## General programs
- xrandr
- paru (aliased as yay)

## Programs needed for i3blocks
- i3, i3lock-color
- bluez, bluez-utils, bluetoothctl
- NetworkManager
- i3blocks
- volumeicon
- acpi (for battery)
- mpstat (for cpu usage)

## Firefox configurations
- Tampermonkey (Tampermonkey gist uploaded)
- Vimium
- uBlock Origin

## Framework specific fixes

# /etc/default/grub changes
`GRUB_CMD_LINUX_DEFAULT="nvme.noacpi=1"`

This improves battery life

# /etc/modprobe.d file to be added
- blacklist-hid.conf
    - blacklist hid_sensor_hub

# Thermal controls
`sudo pacman -S thermald`
`sudo systemctl enable thermald.service`

`sudo pacman -S tlp`

`yay fw-ectool-git`
`yay framework-system-git`

## Setup for my eGPU

# /etc/mkinitcpio.conf changes
`MODULES=(btrfs thunderbolt nvidia nvidia_modeset nvidia_uvm nvidia_drm)`

# /etc/default/grub changes
`GRUB_CMDLINE_LINUX_DEFAULT="nvidia.NVreg_OpenRmEnableUnsupportedGpus=1 nvidia-drm.modeset=1"`

May require the following changes to LINUX_DEFAULT as well but unsure: `"intel_iommu=on nvidia-drm.fbdev=1 acpi_osi=!Windows 2020 acpi_cpufreq=performance"`

# /etc/modeprobe.d file to be added
- blacklist-nouveau.conf
    - blacklist nouveau
    - options nouveau modeset=0

# Installed programs
- nvidia
- nvidia-prime
- nvidia-prime-select-git
- nvidia-setting
- nvidia-utils

# Run included egpu-switcher executable to generate xorg.conf

`sudo cp .config/scripts/egpu-switcher /opt/egpu-switcher
sudo chmod 755 /opt/egpu-switcher
sudo ln -s /opt/egpu-switcher /usr/bin/egpu-switcher
sudo egpu-switcher enable`
