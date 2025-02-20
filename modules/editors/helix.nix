{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        mouse = false;
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
  };
}
