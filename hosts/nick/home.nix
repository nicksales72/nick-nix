{ ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "25.11";

  home.file = { };

  programs.home-manager.enable = true;
}
