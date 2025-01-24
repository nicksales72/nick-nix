{ config, pkgs, lib, ... }: {  
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {        
      theme = "gruber-darker";
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

