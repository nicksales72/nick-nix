{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ vimtex ultisnips markdown-preview-nvim ];
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
      autocmd FileType markdown setlocal spell spelllang=en_us
      inoremap ( ()<Left>
      inoremap { {}<Left>
      inoremap [ []<Left>
      inoremap " ""<Left>
    '';
  };
}
