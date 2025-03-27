{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true; 

    userName = "nicksales72";
    userEmail = "nicksales72@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
  };
}

