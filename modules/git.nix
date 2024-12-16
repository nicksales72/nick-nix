{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true; 

    userName = "nicksales7";
    userEmail = "nicksales72@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}

