{ pkgs, ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  programs.home-manager.enable = true;

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "25.11";

  home.file = { };

  home.pointerCursor = {
    name = "rose-pine-cursor";
    package = pkgs.rose-pine-cursor;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    x11.defaultCursor = pkgs.rose-pine-cursor;
  };

  home.packages = with pkgs; [
    discord
    gimp
    vial
    lean4
    cargo
    rustc
    spotify
    clang-tools
    cabal-install
    rose-pine-cursor
    rose-pine-hyprcursor
    texlive.combined.scheme-full
  ];

}
