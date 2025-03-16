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

**General OS Setup**

```bash
yay -S zoxide feh playerctl brightnessctl pavucontrol curl zip unzip eza ripgrep fzf openssh git noto-fonts noto-fonts-cjk noto-fonts-emoji rofi
```

<details>
<summary>I3 - Supporting Packages</summary>

// TODO: This

```bash
yay -S dunst
```

</details>
<details>
<summary>AwesomeWM - Supporting Packages</summary>

// TODO: This

</details>
<details>
<summary>Sway - Supporting Packages</summary>

// TODO: This

</details>
<details>
<summary>SSH</summary>

```bash
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519.GitHub -C "${HOST} GitHub"
ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519.GitLab -C "${HOST} GitLab"
nvim ~/.ssh/config
```

```
Host github.com
    IdentityFile ~/.ssh/id_ed25519.GitHub

Host gitlab.com
    IdentityFile ~/.ssh/id_ed25519.GitLab
```

```bash
cat ~/.ssh/id_ed25519.GitHub.pub
cat ~/.ssh/id_ed25519.GitLab.pub
```

Copy the public keys into your respective Git providers

</details>
<details>
<summary>Yay</summary>

[Install yay from binary](https://github.com/Jguer/yay?tab=readme-ov-file#binary)

```
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin
```

</details>
<details>
<summary>Terminal</summary>

```bash
yay -S kitty zsh starship
```

Change the shell to zsh

```
chsh -s /bin/zsh
```

And [install Zap](https://github.com/zap-zsh/zap) to manage the zsh plugins

```
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep
```

</details>

<details>
<summary>Firefox</summary>

```bash
yay -S firefox
```

- Open firefox
- Go to "about:profiles"
- Create a new profile
- Open browser in new profile
- Close browser in new profile
- Download (Right click -> `Save Link As...`) the [User.js File](https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js) into the new profiles directory
- Open browser in new profile
- Close all other tabs
- Delete original profiles
- Install Ublock Origin
- Install Bitwarden
- Go through Firefox settings and remove unwanted settings (Password manager, address auto fill, additional search engines, ect...)
</details>
<details>
<summary>Neovim</summary>

> Install Yarn before opening Neovim!

```bash
yay -S neovim xclip
```

Open Neovim.

</details>
<details>
<summary>Tmux</summary>

```bash
yay -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux
```

`Ctrl-B I`

</details>
<details>
<summary>Node</summary>

If you installed Zap with my ZSH config, FNM should already be installed on the system. If not install [FNM](https://github.com/Schniz/fnm)

```bash
fnm install --lts
fnm use *version that was installed*
fnm default *version that was installed*
npm i -g yarn
```

// TODO: Mason config

</details>
<details>
<summary>Go</summary>

```bash
yay -S go
```

// TODO: Mason config

</details>
<details>
<summary>Python</summary>

```bash
yay -S python-conda
```

// TODO: Mason config

</details>
<details>
<summary>MongoDB</summary>

```bash
yay -S mongodb-compass mongodb-tools
```

</details>
<details>
<summary>Docker</summary>

//TODO: This

</details>
<details>
<summary>GTK</summary>

```bash
yay -S rose-pine-gtk-theme-full lxappearance
```

- Open LxAppearance and set theme to Rose Pine
</details>
<details>
<summary>SDDM</summary>

```bash
yay -S sddm
sudo systemctl enable sddm
```

</details>
<details>
<summary>Terraform</summary>

```bash
yay -S terraform
terraform login
```

</details>
<details>
<summary>Thunar</summary>

```bash
yay -S thunar gvfs thunar-volman
```

- Launch Thunar
- Edit -> Preferences -> Advanced
- Check "Enable Volume Management" - Mount removable drives when hot-plugged - Mount removable media when inserted
</details>
<details>
<summary>Other Apps</summary>

```bash
yay -S slack-desktop spotify-launcher discord obsidian flameshot winbox steam
```

</details>
<details>
<summary>Keyring</summary>

```bash
yay -S gnome-keyring libsecret seahorse
```

</details>
<details>
<summary>Pacman</summary>

```bash
sudo nvim /etc/pacman.conf
```

Un comment the line with "Color"

```bash
sudo nvim /etc/makepkg.conf
```

change "debug" to "!debug"

</details>


# Starting hyprland rough docs

Install arch minimal

edit /etc/pacman.conf
edit /etc/makepkg.conf

install yay

install fonts

```
yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji
```

install hyprland + packages

```
yay -Syu hyprland uwsm gdm kitty rofi-wayland dunst xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland waybar swww hypridle hyprlock
```

clone dots

```
yadm clone https://github.com/Lil-Strudel/.dotfiles.git

```

update headers

```
yay -Syu linux-headers

reboot
```

install things

```
yay -S fnm pnpm go rustup openssh eza fzf ripgrep zoxide wl-clipboard neovim tmux firefox
```

switch to zsh

