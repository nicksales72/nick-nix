{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.lineNumbers" = "relative"; 
      };
      extensions = with pkgs; [
        vscode-extensions.vscodevim.vim
      ];
    };
  };
}
