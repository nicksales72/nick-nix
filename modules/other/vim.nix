{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    extraConfig = ''
      syntax on
      set background=dark
      set tabstop=2
      set shiftwidth=2
      set smartindent 
      set autoindent
      set expandtab
      set ai
      set relativenumber
      set hlsearch
      set ruler
    '';
  };
}
