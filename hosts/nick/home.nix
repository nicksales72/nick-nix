{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    mnemosyne 
    obsidian
    zathura
    texlive.combined.scheme-full
    nodejs
    haskell-language-server
    firefox
    discord
    neofetch
    prismlauncher
    cabal-install
    ghc
    jdk
    zip
    unzip
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
