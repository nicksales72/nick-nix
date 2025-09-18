{ config, pkgs, lib, ... }: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.lineNumbers" = "relative";
        "vim.useSystemClipboard" = true;
        "workbench.colorTheme" = "Default Dark Modern";
      };
      extensions = with pkgs; [
        vscode-extensions.vscodevim.vim
      	vscode-extensions.shd101wyy.markdown-preview-enhanced
      ];
    };
  };
}
