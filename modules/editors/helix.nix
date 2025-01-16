{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    texlab
    tectonic
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

    [language-server.config.texlab.build]
    onSave = true
    forwardSearchAfter = true

    [language-server.config.texlab.forwardSearch]
    executable = "zathura"
    args = [ "--synctex-forward", "%l:1:%f", "%p" ]

    [language-server.config.texlab.chktex]
    onEdit = true
'';
}
