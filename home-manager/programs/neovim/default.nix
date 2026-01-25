# Almost entirely copied from https://github.com/Kidsan/nixos-config/blob/dd22fb5ddf412acc71d6a27473ec822cd40314c3/home/programs/neovim/default.nix

{ pkgs, ... }:
let

  treesitterWithGrammars = (
    pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
      p.bash
      p.comment
      p.css
      p.dockerfile
      p.fish
      p.gitattributes
      p.gitignore
      p.go
      p.gomod
      p.gowork
      p.hcl
      p.javascript
      p.jq
      p.json5
      p.json
      p.lua
      p.make
      p.markdown
      p.nix
      p.python
      p.rust
      p.svelte
      p.toml
      p.typescript
      p.vue
      p.yaml
    ])
  );

  treesitter-parsers = pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = treesitterWithGrammars.dependencies;
  };
in
{

  home.packages = with pkgs; [
    # -- Plugin deps --
    fd
    ripgrep
    xclip
    nodejs_latest
    wakatime-cli

    # -- LSP --
    typos-lsp # Spell check
    neocmakelsp # Cmake
    lua-language-server # Lua
    pyright # Python
    rust-analyzer # Rust
    gopls # Go
    slint-lsp # Slint
    nixd # Nix
    emmet-ls # HTML esque
    svelte-language-server # Svelte

    # -- Formatters --
    stylua # Lua
    isort # Python
    black # Python
    gofumpt # Go
    taplo # TOML
    rustfmt # Rust
    nixfmt-rfc-style # Nix

    # -- Linters --
    pylint # Python
    luajitPackages.luacheck # Lua
    golangci-lint # Go
    clippy # Rust

    # packages with results in /lib/node_modules/.bin must come at the end

    pyright
    emmet-ls
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.eslint_d
    nodePackages.prettier
  ];

  programs.neovim = {
    enable = true;
    # Neovim-unwrapped is used by default. And the wrapped version has features added to it that we are using
    package = pkgs.neovim-unwrapped;
    vimAlias = false;
    withNodeJs = true;
    defaultEditor = false;

    plugins = [
      treesitterWithGrammars
    ];
  };

  # Move the nvim config to .config
  home.file."./.config/nvim" = {
    source = ./config;
    recursive = true;
  };

  # Tell treesitter about all the parsers

  home.file."./.config/nvim/lua/options/treesitter-parsers-loader.lua".text = ''
    vim.opt.runtimepath:append("${treesitter-parsers}")
  '';

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
  home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitterWithGrammars;
  };
}
