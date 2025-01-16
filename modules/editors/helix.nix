{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    tectonic
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "varua";
      editor = {
        line-number = "relative";
        mouse = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
