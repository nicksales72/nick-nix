{ ... }: {
  imports = [
    ../../imports/user-modules.nix
  ];

  home.username = "kafka";
  home.homeDirectory = "/home/kafka";
  home.stateVersion = "25.05";

  home.file = { };

  programs.home-manager.enable = true;
}
