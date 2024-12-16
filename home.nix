{ config, pkgs, ... }:

{
  imports = [
    ./modules/helix.nix
    ./modules/i3blocks.nix
    ./modules/git.nix
    ./modules/gtk-settings.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    alacritty
    google-chrome
    discord
    git
    neofetch
    ranger
    zathura
    prismlauncher
    cabal-install
    ghc
    tree
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
