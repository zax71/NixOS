# Neovim Config

This is a custom neovim config packaged in a [NixOS Flakes](https://wiki.nixos.org/wiki/Flakes). This was mostly based off [PrimaMaterina's excellent guide](https://primamateria.github.io/blog/neovim-nix/) regarding the subject.

## Structure

- `flake.nix`: This is the entrypoint, loads all the other `.nix` files.
- `plugins.nix`: Where all the Neovim plugins are defined.
- `packages/zax-neovim.nix`: The [overlay](https://nixos-and-flakes.thiscute.world/nixpkgs/overlays) used to add my config files and deps to the flake
- `runtimeDeps.nix` All the LSPs, Formatters, linters and other associated paraphernalia
- `config/`: All the lua files
  - `default.nix`: Loads the lua files in to `/etc/nixos`

## Usage

Clone this repo on a NixOS system with `git clone https://github.com/zax71/nvim.git` then run it with `nix run`. To alias `neovim` to run this make an alias with your favourate shell to run `nix run <path to directory containing flake.nix> --` with the `--` there so that your files aren't considered nix run options

## Features

- [Catppuccin](https://catppuccin.com/) theme
- Syntax hylighting, LSP, linter and formatter support for many langs
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) for file searching. Configered to auto hide files in `.gitignore`
- [Lualine](https://github.com/nvim-lualine/lualine.nvim) for a nice status bar
