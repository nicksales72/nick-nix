{ lib, ... }: {
  imports = [
    ../modules/editors/vscode.nix
    ../modules/wm/i3blocks.nix
    ../modules/tools/git.nix
    ../modules/themes/gtk-settings.nix
    ../modules/terminals-shells/ghostty.nix
    ../modules/terminals-shells/tmux.nix
  ];
}

