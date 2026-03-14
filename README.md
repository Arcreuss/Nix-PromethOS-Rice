<p align="center">
  <img src="https://i.imgur.com/X5zKxvp.png" height="120"/>
  <span style="font-size:40px; padding:0 20px;"></span>
  <img src="https://raw.githubusercontent.com/hyprwm/Hyprland/main/assets/header.svg" height="120"/>
</p>

# NixOS & Flake

### :warning: This repository is currently under development :construction:
I do not recommend cloning the repository at this time, as the initial structure has not yet been finalized.\
Since the project is still in development and brand new, I am not accepting contributors or pull requests at this time.\
For now, please use this template as a guide to help you create your own.

### :triangular_flag_on_post: IMPORTANT: You should NOT deploy this flake directly on your machine :exclamation:
> The flake contains my hardware configuration file, which is not suitable for your hardware.\
> Please make the necessary changes to adapt it to your machine and user account before rebuilding the Nix configuration.

## The challenge with NixOS
This is my first time using NixOS, and I can already tell that learning and building my own architecture is a difficult challenge.
NixOS has the perfect philosphy of what I was looking for : Stability, Reproducible, Control.\
I love how NixOS lets you manage your system however you want.\
Here, the goal is to create a solid and robust architecture as possible, within my beginner's capabilities.

## Installation
:exclamation: Please keep your **hardware-configuration.nix** and move it under your new host folder. :exclamation:
```bash
git clone https://github.com/Arcreuss/Nix-PromethOS-Rice.git
cd Nix-PromethOS-Rice
sudo nixos-rebuild switch --flake .#YourHost
```

Don't forget to add your user in **nixos/modules/users.nix**, you can use my configuration as reference.\
Then execute the command line below to set your password.
```bash
passwd YourUser
```

Create a new user file under the path *nixos/home/users/* to use the HomeManager.
```bash
{ pkgs, ... }:

{
  home.username = "YourUserName";
  home.homeDirectory = "/home/YourUserDirectory";
  home.stateVersion = "YourVersion";

  home.sessionVariables = {
    # Declare here all environnement variables for your user.

    # Examples
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  }; 
}
```
For your new personal host, you have to link it with your user thought the Home Manager.\
Create a new **home.nix** inside *nixos/hosts/YourHostFolder* and add this configuration.
```bash
{ ... }:

{
  imports = [
    ../../home/users/YourUser.nix
    ../../home/profiles/YourProfile.nix
  ];
}
```
If you wan to create a new profile, please always use this configuration as a minimal requirement.
```bash
{ ... }:

{
  imports = [
    ../modules/core.nix  # Add others modules after the core.nix
  ];
}
```

## Configuration, Profile, Settings
The main goal is to share a continious intregration of my configuration, easily usable after cloning by anyone.\
Currently, my system uses Flake, a HomeManager for my user, Hosts and Profiles concepts.

### Components
| | NixOS (Wayland) |
|--|--|
| **Window Manager**| [Hyprland](https://github.com/hyprwm/Hyprland) |
| **Terminal Emulator** | [Kitty](https://github.com/kovidgoyal/kitty) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) + [GTK](https://github.com/GNOME/gtk) |
| **Lockscreen** | [Hyprlock](https://github.com/hyprwm/hyprlock) |
| **Launcher** | [Rofi](https://github.com/adi1090x/rofi) |
| **Color Scheme** | [Wallust](https://docs.rs/wallust/latest/wallust/index.html) |
| **Network management tool** | [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager) |
| **System resource monitor** | [Btop](https://github.com/aristocratos/btop) |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) |
| **Shell** | [zsh](https://www.zsh.org/) + [Starship](https://github.com/starship/starship) |
| **Media Player** | [mpv](https://github.com/mpv-player/mpv) |
| **Text Editor** | [Neovim](https://github.com/neovim/neovim.github.io/) |
| **Fonts** | [Nerd fonts](https://www.nerdfonts.com/) |
| **Wallpaper** | [Wallust](https://docs.rs/wallust/latest/wallust/index.html) |
| **Youtube player** | [yt-x](https://github.com/Benexl/yt-x) |
| **Filesystem & encryption** | [btrfs subvolumes](https://btrfs.readthedocs.io/en/latest/) |

## Hyprland
As a fan of Arch ricing, I decided to customize my own NixOS WindowManager from scratch with Hyprland, which I had never used or setup before.\
The Hyprland settings are dsitributed under the path *../nixos/home/modules/hyprland/* in order to easily define a new profile.\
The keyboard shortcuts are based on Vim for the navigation.

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
  
