{ lib, ... }: {
  imports = [
    ../modules/editors/helix.nix
    ../modules/tools/git.nix
    ../modules/terminals-shells/ghostty.nix
    ../modules/terminals-shells/nushell.nix
    ../modules/terminals-shells/tmux.nix
  ];
}

