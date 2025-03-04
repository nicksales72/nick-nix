{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "penumbra+";
      editor = {
        line-number = "relative";
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
