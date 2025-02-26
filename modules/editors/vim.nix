{ config, pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [ nord-vim vimspector vim-lsp vimtex ultisnips ];
    extraConfig = ''
      syntax on
      colorscheme nord
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
      let g:vimtex_view_method = 'zathura'
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
