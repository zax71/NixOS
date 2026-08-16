# NixOS config

[NixOS](https://nixos.org/) is an entirely declarative package manager and Linux distribution. It's config is all in one place and for me... That one place is here! I use the [NNN stack](https://the-nnn-stack.github.io/) (Nix Niri Noctalia) that I transitioned to from AwesomeWM.

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

---

**No artificial intelligence was used in the making of this.**

<a href="https://brainmade.org/">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://brainmade.org/white-logo.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://brainmade.org/black-logo.svg">
  <img alt="brainmade" src="https://brainmade.org/white-logo.svg">
</picture>
</a>
