{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      background = "dark"; 
      relativenumber = true;
    };
  };
}
