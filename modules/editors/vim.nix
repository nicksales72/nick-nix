{ confi, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      syntax on
      set tabstop=2
      set shiftwidth=2
      set expandtab
      set ai
      set relativenumber
      set hlsearch
      set ruler
      highlight Comment ctermfg=green  
    '';
  };
}
