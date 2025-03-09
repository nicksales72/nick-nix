{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dark_plus";
      editor = {
        line-number = "relative";
        soft-wrap = {
          enable = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };      
      keys.normal = {
        C-t = ":sh tectonic main.tex";
      };
    };
    extraPackages = with pkgs; [
      tectonic
      yazi
    ];
  };
}