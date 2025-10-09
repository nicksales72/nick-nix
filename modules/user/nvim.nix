{ pkgs, ... }: {
  # will write neovim config here when not lazy
  home.packages = with pkgs; [
    # lsps
    nixd
    ccls
    rust-analyzer
    haskell-language-server
    texlivePackages.digestif
  ];
}
