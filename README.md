## Arch install settings

- **Language:** English
- **Mirrors:** United States
- **Locales:** Default
- **Disc Configuration:** I prefer to just the entire disk
- **Bootloader:** GRUB
- **Unified Kernel Images:** False
- **Swap:** True
- **Host Name:** t8
- **Root Password:**
- **User Account:** Make a super user
- **Audio:** Pipewire
- **Kernels:** linux-zen
- **Additional Packages:**
- **Network Configuration:** Network Manager
- **Timezone:** US/Mountain
- **Automatic Time Sync (NTP):** True
- **Optional Repositories:** Blank
- **Profile:**
  - **Destkop:** i3
  - **Graphics Driver:** I am using an AMD GPU so I choose that
  - **Greeter:** Ly

## Install yadm

```
sudo pacman -S yadm
yadm clone https://github.com/T888R/yadm-dotfiles
yadm decrypt
```

## Fonts

- I use FiraCode and MonoLisa for my fonts placed in .local/share/fonts
  (but not MonoLisa since it is a paid font)

## Shell

- Change to zsh
  `chsh -s /bin/zsh`
- Kitty is my terminal of choice

## General programs

- xrandr
- yay
- ffmpeg
- legcord (Discord alternative that works with my interface and Pipewire)
- (Discord sometimes works)

## Programming related pacakges

- ffmpeg
- sqlite3
- golang
- cmake
- python3

## Programs needed for i3

- i3, i3lock-color
- bluez, bluez-utils, bluetoothctl
- NetworkManager
- i3blocks
- volumeicon
- acpi (for battery)
- mpstat (for cpu usage)
- rofi

## Firefox configurations

- Tampermonkey (Tampermonkey gist uploaded)
- Vimium
- uBlock Origin
- Firefox Color

## Rofi configuration

- Clone adi1090x's themes

```
git clone --depth=1 https://github.com/adi1090x/rofi.git
```

## Audio configuration programs

- Helvum
- pwvucontrol
- spotify

## Neovim

- ripgrep (Needed to make Neovim project grep work)

## Framework specific fixes

### /etc/default/grub changes

This improves battery life
`GRUB_CMD_LINUX_DEFAULT="nvme.noacpi=1"`

### /etc/modprobe.d file to be added

- blacklist-hid.conf
  - `blacklist hid_sensor_hub`

### Thermal controls

```
sudo pacman -S thermald
sudo systemctl enable thermald.service
yay fw-ectool-git
yay framework-system-git
sudo pacman -S power-profiles-daemon
```

Use powerprofilesctl to list all the available profiles and use set to choose it

## Setup for my eGPU (This is deprecated due to switching to an AMD card)

### /etc/mkinitcpio.conf changes

`MODULES=(btrfs thunderbolt nvidia nvidia_modeset nvidia_uvm nvidia_drm)`

### /etc/default/grub changes

`GRUB_CMDLINE_LINUX_DEFAULT="nvidia.NVreg_OpenRmEnableUnsupportedGpus=1 nvidia-drm.modeset=1"`

May require the following changes to LINUX_DEFAULT as well but unsure:
`"intel_iommu=on nvidia-drm.fbdev=1 acpi_osi=!Windows 2020 acpi_cpufreq=performance"`

### /etc/modeprobe.d file to be added

- blacklist-nouveau.conf

```
blacklist nouveau
options nouveau modeset=0
```

### Installed programs

- linux-zen-headers
- nvidia-dkms (Make sure to include pacman hook! This is needed for the Zen kernel)
- nvidia-prime
- nvidia-prime-select-git
- nvidia-setting
- nvidia-utils

- If eDP isn't showing up, it might need to be enabled via Arandr

### Run included egpu-switcher executable to generate xorg.conf

```
sudo cp .config/scripts/egpu-switcher /opt/egpu-switcher
sudo chmod 755 /opt/egpu-switcher
sudo ln -s /opt/egpu-switcher /usr/bin/egpu-switcher
sudo egpu-switcher enable
```
