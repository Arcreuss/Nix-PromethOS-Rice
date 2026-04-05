<p align="center">
  <img src="https://i.imgur.com/X5zKxvp.png" height="120"/>
  <span style="font-size:40px; padding:0 20px;"></span>
  <img src="https://raw.githubusercontent.com/hyprwm/Hyprland/main/assets/header.svg" height="120"/>
</p>
<p align="center">
    <img src="https://img.shields.io/badge/NixOS-25.11-informational.svg?style=flat&logo=nixos&logoColor=CAD3F5&colorA=24273A&colorB=8AADF4">
  <img src="https://img.shields.io/badge/NixOS-Flake-blue"/>
  <img src="https://img.shields.io/badge/Hyprland-Wayland-green" height="120"/>
</p>

# NixOS & Flake

### :warning: This repository is currently under development :construction:
The initial structure has just been finalized, knowledge of NixOS and how it works is necessary to maintain and modify it.\
Since the project is still in development and brand new, I am not accepting contributors or pull requests at this time.\
For now, please use this template as a guide to help you create your own.

---

### :triangular_flag_on_post: IMPORTANT: You should NOT deploy this flake directly on your machine :exclamation:
> The flake contains my hardware configuration file, which is not suitable for your hardware.\
> Please make the necessary changes to adapt it to your machine and user account before rebuilding the Nix configuration.

---

## The challenge with NixOS
This is my first time using NixOS, and I can already tell that learning and building my own architecture is a difficult challenge.
NixOS provides exactly the philosophy I was looking for: stability, reproducibility and full control over the system.\
I love how NixOS lets you manage your system however you want.\
Here, the goal is to create a solid and robust architecture as possible, within my beginner's capabilities.

---

## Hyprland
As a fan of Arch ricing, I decided to customize my own NixOS window manager from scratch with Hyprland, which I had never used or setup before.\
The Hyprland settings are distributed under the path *../nixos/home/modules/hyprland/* in order to easily define a new profile.\
The keyboard shortcuts are based on Vim for the navigation.

---

## Features
- NixOS flake-based configuration
- Modular host/profile architecture
- Hyprland configuration split into reusable modules
- Waybar + GTK theming
- Dynamic color schemes using Wallust
- Multi-host ready configuration

---

## Structure
```bash
.
├── flake.nix
├── hosts/
│   └── promethos-desktop/
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── home.nix
├── modules/
├── home/
│   ├── users/
│   ├── profiles/
│   └── modules/
├── packages/
└── overlays/
```

## Configuration, Profile, Settings
The main goal is to share a continuous integration of my configuration, easily usable after cloning by anyone.\
Currently, my system uses Flake, a HomeManager for my user, Hosts and Profiles concepts.

---

### Components
| | NixOS (Wayland) |
|--|--|
| **Window Manager**| [Hyprland](https://github.com/hyprwm/Hyprland) |
| **Terminal Emulator** | [Kitty](https://github.com/kovidgoyal/kitty) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) + [GTK](https://github.com/GNOME/gtk) |
| **Lockscreen** | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| **Launcher** | [Rofi](https://github.com/adi1090x/rofi) |
| **Color scheme generator** | [Wallust](https://docs.rs/wallust/latest/wallust/index.html) |
| **Network management tool** | [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager) |
| **System resource monitor** | [Btop](https://github.com/aristocratos/btop) |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) |
| **Shell** | [zsh](https://www.zsh.org/) + [Starship](https://github.com/starship/starship) |
| **Media Player** | [mpv](https://github.com/mpv-player/mpv) |
| **Text Editor** | [Neovim](https://github.com/neovim/neovim.github.io/) |
| **Fonts** | [Nerd fonts](https://www.nerdfonts.com/) |
| **Wallpaper** | [swww](https://github.com/LGFae/swww) + pickwall (internal pkg)| 
| **Youtube player** | [yt-x](https://github.com/Benexl/yt-x) |
| **Filesystem & encryption** | [btrfs subvolumes](https://btrfs.readthedocs.io/en/latest/) |
| **Notifications** | [swaync](https://github.com/ErikReider/SwayNotificationCenter) |
| **Screenshots** | [grim](https://gitlab.freedesktop.org/emersion/grim) + [slupr](https://github.com/emersion/slurp) + [swappy](https://github.com/jtheoof/swappy) | 

---

## Installation

❗Please keep your **hardware-configuration.nix** and adapt it to your machine.

### :triangular_flag_on_post: Important notes before starting

This setup is fully declarative and hardware-dependent.

Before deploying:

* Do **not** reuse my `hardware-configuration.nix`
* Always generate your own after installation
* Ensure disk UUIDs match your system

---

### 1. Clone the repository (SSH recommended)

```bash
git clone git@github.com:Arcreuss/Nix-PromethOS-Rice.git /etc/nixos
cd /etc/nixos
```

> ⚠️ Avoid HTTPS cloning to prevent GitHub authentication issues.

---

### 2. Fix permissions on `/etc/nixos`

By default, `/etc/nixos` is owned by root.

```bash
sudo chown -R $USER:users /etc/nixos
```

This allows:

* editing without sudo
* using git normally

---

### 3. Hardware & base configuration (CRITICAL :triangular_flag_on_post:)

After a fresh NixOS installation, the following files are already generated:

```text
/etc/nixos/hardware-configuration.nix
/etc/nixos/configuration.nix
```

You should **reuse these files**, as they are already adapted to your system.

### Move them into your host

```bash
mv /etc/nixos/hardware-configuration.nix /etc/nixos/hosts/YourHost/
mv /etc/nixos/configuration.nix /etc/nixos/hosts/YourHost/
```

> ⚠️ These files are machine-specific and required for a correct boot.

### If the files are missing

If you accidentally deleted them or replaced your system:

```bash
sudo nixos-generate-config
```

This will regenerate both:

* `hardware-configuration.nix`
* `configuration.nix`

Then move them again into your host folder.

### Update `configuration.nix`

Ensure your host configuration imports the correct hardware file:

```nix
imports = [
  ./hardware-configuration.nix
  # other modules...
];
```

### Important

* `hardware-configuration.nix` defines:

  * disks
  * partitions
  * swap
  * filesystems

* `configuration.nix` is your system entry point:

  * it must be correctly placed inside your host
  * and used by your flake

> ⚠️ A mismatch here can prevent your system from booting.

---

### 4. Verify disk UUIDs

Check your disks:

```bash
lsblk -f
```

Ensure these match inside `hardware-configuration.nix`:

* `/` (root)
* `/boot`
* `swap`

---

### 5. Configure hibernation (if using swap)

Update in:

```
modules/boot.nix
```

```nix
boot.resumeDevice = "/dev/disk/by-uuid/YOUR_SWAP_UUID";
```

> ⚠️ A wrong UUID will cause the system to hang during boot.

---

### 6. Add your user

Edit:

```
modules/users.nix
```

Then set your password:

```bash
passwd YourUser
```

---

### 7. Create your Home Manager user

Create:

```
home/users/YourUser.nix
```

```nix
{ pkgs, ... }:

{
  home.username = "YourUserName";
  home.homeDirectory = "/home/YourUserDirectory";
  home.stateVersion = "YourVersion";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };
}
```

---

### 8. Link Home Manager to your host

Create:

```
hosts/YourHost/home.nix
```

```nix
{ ... }:

{
  imports = [
    ../../home/users/YourUser.nix
    ../../home/profiles/YourProfile.nix
  ];
}
```

---

### 9. Create a profile (optional)

Minimal structure:

```nix
{ ... }:

{
  imports = [
    ../modules/core.nix
  ];
}
```

---

### 10. Git configuration (Home Manager)

Git is declarative in this setup.

Do **not** use:

```bash
git config --global
```

Instead, configure in Home Manager:

```nix
programs.git.settings.safe.directory = [ "/etc/nixos" ];
```

---

### 11. SSH setup (GitHub)

Restore your SSH keys:

```bash
cp -r /path/to/backup/.ssh ~/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
```

Test:

```bash
ssh -T git@github.com
```

---

### 12. GPG (optional)

```bash
rsync -av /path/to/backup/.gnupg ~/.gnupg
chmod 700 ~/.gnupg
find ~/.gnupg -type f -exec chmod 600 {} \;
```

---

### 13. Build the system

```bash
sudo nixos-rebuild switch --flake /etc/nixos#YourHost
```

---

### 14. First boot checks

```bash
lsblk -f
swapon --show
zramctl
```

Optional test:

```bash
systemctl hibernate
```

---

### 15. Common pitfalls

* Wrong `hardware-configuration.nix`
* Wrong swap UUID → boot freeze
* HTTPS Git → authentication failure
* Missing `/etc/nixos` permissions
* Incorrect `.ssh` ownership
* Trying to edit Git config manually (overwritten by Home Manager)

---

### Final note

This system is designed to be reproducible.

If something breaks:

> Fix the configuration, not the system.

---

## Theme & Visuals
The final result should be something visually refined and classic.\
My inspiration is coming from this [video](https://youtu.be/1-3_ecWMCYI?si=Rvj_1F8Deu94mCbc).

## Documentation & Chat GPT
In order to complete my challenge, I read the NixOS documentation and used Chat GPT as a mentor to break down the main goal into smaller goals with consistent learning and progression.

## Resources and Inspiration
Other dotfiles, repository, youtubers that inspired me:
- Nix Flakes Architecture and Usage
  - [ryan4yin](https://github.com/ryan4yin/nix-config)
  - [shin](https://github.com/linuxmobile/shin)
  - [NischalDawadi](https://github.com/NischalDawadi/Hyprlust/)
  - [Vimjoyer](https://www.youtube.com/@vimjoyer)
- Visuals Inspirations
  - [Codingclinician Rice](https://youtu.be/1-3_ecWMCYI?si=RNqcZtxoBRHC0PEy)
  - [Wallpapers](https://github.com/NischalDawadi/Wallpapers)
  
If this repository helps you build your own NixOS setup, feel free to use it as inspiration.
