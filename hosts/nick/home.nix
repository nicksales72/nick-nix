{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    texlive.combined.scheme-full
    obsidian
    zathura
    nodejs
    haskell-language-server
    firefox
    discord
    neofetch
    prismlauncher
    ghc
    jdk
    lm_sensors
    dconf
    acpi
    marksman
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
