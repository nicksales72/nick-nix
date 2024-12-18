{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {        
      theme = "ferra";
      editor = {
        line-number = "relative";
        mouse = false;
        file-picker = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };
}
