{ pkgs, ... }: {
  # will write neovim config here when not lazy
  home.packages = with pkgs; [
    # lsps
    neovim
    nixd
    ccls
    rust-analyzer
    haskell-language-server
    texlivePackages.digestif
  ];
}
