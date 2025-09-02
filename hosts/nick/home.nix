{ pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  programs.home-manager.enable = true;

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "25.11";

  home.file = { };

  home.packages = with pkgs; [
    discord
    clang-tools
    gimp
    cabal-install
    lean4
    cargo
    rustc
    spotify
    vial
    nwg-look
    rose-pine-cursor
    rose-pine-hyprcursor
    texlive.combined.scheme-full
  ];

}
