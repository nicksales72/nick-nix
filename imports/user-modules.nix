{ lib, ... }: {
  imports = [
    ../modules/editors/vim.nix
    ../modules/editors/ultisnips.nix
    ../modules/tools/zathura.nix
    ../modules/tools/git.nix
    ../modules/terminals-shells/ghostty.nix
    ../modules/terminals-shells/tmux.nix
  ];
}

