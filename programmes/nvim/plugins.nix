{ pkgs }:
with pkgs.vimPlugins;
[
  # Telescope 
  telescope-nvim
  telescope-fzf-native-nvim
  nvim-web-devicons

  nvim-lspconfig
  todo-comments-nvim
  nvim-lint
  conform-nvim
  nvim-colorizer-lua

  # Nvim-cmp
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp_luasnip
  friendly-snippets
  luasnip

  dressing-nvim
  lualine-nvim

  (nvim-treesitter.withPlugins (p: [
    p.c
    p.vim
    p.vimdoc
    p.query
    p.svelte
    p.javascript
    p.typescript
    p.lua
    p.html
    p.bash
    p.css
    p.json
    p.toml
    p.yaml
    p.jsdoc
    p.nix
    p.scss
    p.html
    p.tsx
    p.rust
    p.kotlin
    p.markdown
    p.markdown_inline
    p.regex
    p.slint
  ]))

  vim-wakatime
  catppuccin-nvim
]
