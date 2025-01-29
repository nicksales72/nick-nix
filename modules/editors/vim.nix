{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ vimtex ultisnips ];
    extraConfig = ''
      syntax on
      colorscheme phoenix
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
      let g:UltiSnipsExpandTrigger = '<tab>'
      let g:UltiSnipsJumpForwardTrigger = '<tab>'
      let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
      let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
      autocmd FileType tex inoremap $ $$<Left>
      inoremap ( ()<Left>
      inoremap { {}<Left>
      inoremap [ []<Left>
      inoremap " ""<Left>
    '';
  };
}
