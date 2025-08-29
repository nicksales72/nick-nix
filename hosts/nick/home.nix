{ pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

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
    texlive.combined.scheme-full
  ];

  programs.home-manager.enable = true;
}
