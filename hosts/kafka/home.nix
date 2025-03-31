{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "kafka";
  home.homeDirectory = "/home/kafka";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree-sitter
    zathura
    discord
    clang-tools
    texlive.combined.scheme-full
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
