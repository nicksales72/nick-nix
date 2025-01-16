{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    texlab
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "varua";
      editor = {
        line-number = "relative";
        mouse = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };

  home.file.".config/helix/languages.toml".text = ''
    [[language]]
    name = "latex"
    scope = "source.tex"
    injection-regex = "tex"
    file-types = ["tex"]
    roots = []
    comment-token = "%"
    language-server = { command = "texlab" }
    config = { texlab = { build = { onSave = true } } }
    indent = { tab-width = 4, unit = "\t" }
'';
}
