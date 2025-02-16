{ lib, ... }: {
  imports = [
    ../modules/editors/helix.nix
    ../modules/tools/git.nix
    ../modules/themes/gtk-settings.nix
    ../modules/terminals-shells/ghostty.nix
    ../modules/terminals-shells/tmux.nix
  ];
}

