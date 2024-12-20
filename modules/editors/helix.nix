{ config, pkgs, lib, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {        
      theme = "poimandres";
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
    languages = {
      language = [{
        name = "markdown";
        language-servers = ["/home/nick/.nix-profile/bin/ltex-ls"];
        soft-wrap.enable = true;
        soft-wrap.wrap-indicator = "";
      }];
    };
  };
}
