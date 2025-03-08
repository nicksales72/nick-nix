{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.lineNumbers" = "relative"; 
        "vim.useSystemClipbaord" = true;
        "workbench.colorTheme" = "Default Dark Modern";
      };
      extensions = with pkgs; [
        vscode-extensions.vscodevim.vim
      ];
    };
  };
}
