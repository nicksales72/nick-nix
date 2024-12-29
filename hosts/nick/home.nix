{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    texlive.combined.scheme-full
    nodejs
    haskell-language-server
    firefox
    discord
    neofetch
    prismlauncher
    ghc
    jdk
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
