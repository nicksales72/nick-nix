{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ vimtex ultisnips ];
    extraConfig = ''
      syntax on
      colorscheme GruberDarker
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
      inoremap ( ()<Left>
      inoremap { {}<Left>
      inoremap [ []<Left>
      inoremap " ""<Left>
    '';
  };
}
