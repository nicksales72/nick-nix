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

    [language.config.texlab]
    auxDirectory = "build"

    [language-server.texlab.config.texlab.chktex]
    onOpenAndSave = true
    onEdit = true

    [language-server.texlab.config.texlab.forwardSearch]
    executable = "zathura"
    args = [ "--synctex-forward", "%l:%c:%f", "%p" ]

    [language-server.texlab.config.texlab.build]
    auxDirectory = "build"
    logDirectory = "build"
    pdfDirectory = "build"

    forwardSearchAfter = true
    onSave = true

    executable = "tectonic"
    args = [
     "-X",
     "compile",
     "--synctex",
     "--keep-logs",
     "--keep-intermediates",
     "--outdir=build",
     "%f",
     ]
'';
}
