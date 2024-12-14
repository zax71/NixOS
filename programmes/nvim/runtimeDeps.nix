{ pkgs }:
with pkgs;
[
  #   -- Plugin deps --

  fd
  xclip

  #      -- LSP --

  typos-lsp # Spell check
  neocmakelsp # Cmake
  lua-language-server # Lua
  pyright # Python
  rust-analyzer # Rust
  gopls # Go
  slint-lsp # Slint
  nixd # Nix

  #   -- Formatters --

  stylua # Lua
  isort # Python
  black # Python
  gofumpt # Go
  taplo # TOML
  rustfmt # Rust
  nixfmt-rfc-style # Nix

  #    -- Linters --
  pylint
  luajitPackages.luacheck
  golangci-lint
  clippy # Rust

  # packages with results in /lib/node_modules/.bin must come at the end
  pyright
  emmet-ls
  nodePackages.typescript
  nodePackages.typescript-language-server
  nodePackages.eslint_d
  nodePackages.prettier
]
