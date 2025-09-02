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
    name = "rose-pine-hyprcursor";
    package = pkgs.rose-pine-hyprcursor;
    size = 24;
    gtk.enable = true;

    hyprcursor = {
      enable = true;
      size = 24;
    };
  };

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
    rose-pine-cursor
    texlive.combined.scheme-full
  ];

}
