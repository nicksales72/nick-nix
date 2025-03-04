{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    firefox
    pavucontrol
    fastfetch
    obsidian
    discord
    prismlauncher
    cabal-install
    haskell-language-server
    texlive.combined.scheme-full
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
