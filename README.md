# NixOS config

This is my [NixOS](https://nixos.org/) configuration using the Dendritic patern. I use the [NNN stack](https://the-nnn-stack.github.io/) (Nix Niri Noctalia) that I transitioned to from AwesomeWM.

## Features

- [Niri](https://github.com/niri-wm/niri) scrolling window manager, no more messing about with so many workspaces!
- Graphically configured [Noctalia Shell](https://noctalia.dev/) v5 that can be updated in home-manager by just running `update-noctalia`!
- Stylized terminal with Zsh, [Oh My Posh](https://ohmyposh.dev/) and a [Kitty](https://sw.kovidgoyal.net/kitty/) terminal
- ~~Clean looking application switcher in [Rofi](https://github.com/davatorium/rofi)~~ currently using the Noctalia app switcher but I might switch back to Rofi

## Credits

- [Custom Java package](https://github.com/zax71/NixOS/blob/main/nixos/modules/java.nix) by [gytis-ivaskevicius ](https://github.com/gytis-ivaskevicius/nixfiles/blob/master/config/dev.nix)
- [Neovim configuration](https://github.com/zax71/NixOS/tree/main/home-manager/programs/neovim) that was heavily inspired by [Kidsan](https://github.com/Kidsan/nixos-config/tree/main/home/programs/neovim)

## Screenshots

Outdated
![Screenshot of desktop](/.github/assets/showcase.png)

## Instructions to add new machines

1. Create a new folder in ./modules/hosts/ and copy over the files from another machine as an example, making nessicary changes, including modifying the `disko.nix` file.
2. Download the [minimal NixOS installer image](https://nixos.org/download/#nixos-iso) and flash it to a USB drive, I like to use [caligula](https://github.com/ifd3f/caligula).
3. Boot this iso
4. git clone this repo to the new machine in a temp directory
5. Run `nixos-generate-config --show-hardware-config --no-filesystems > hardware.nix` to generate the hardware configuration for that device, then modify it to be dendritic and add it to ./modules/hosts/this-machiene/
6. Run the following to partition the drive
```sh
sudo nix \
--experimental-features "nix-command flakes" \
  run github:nix-community/disko -- \
  -m destroy,format,mount \
  -f .#<device name>
```
7. If you need to use swap, run `lsblk` and find your swap device then `swapon /dev/<swap device>`
8. Finally run `nixos-install --flake .#<device name>` and `reboot`.
---

**No artificial intelligence was used in the making of this.**

<a href="https://brainmade.org/">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://brainmade.org/white-logo.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://brainmade.org/black-logo.svg">
  <img alt="brainmade" src="https://brainmade.org/white-logo.svg">
</picture>
</a>
