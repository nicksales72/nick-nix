{ config, pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    yazi
    zathura
    tectonic
    chromium
    clang-tools
    discord
    prismlauncher
    cabal-install
    haskell-language-server
    texlive.combined.scheme-full
  ];

  home.file = { };

  programs.home-manager.enable = true;
}
