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
    language-servers = [ "texlab" ]

    [language-server.texlab]
    command = "texlab"

    [language-server.texlab.config]
    auxDirectory = "output"

    [language-server.texlab.config.chktex]
    onOpenAndSave = true
    onEdit = true

    [language-server.texlab.config.build]
    forwardSearchAfter = false
    onSave = false
    executable = "tectonic"
    args = [
    	"-X",
    	"compile",
    	"%f",
    	"--synctex",
    	"--keep-logs",
    	"--keep-intermediates",
    	"--outdir=output",
    	"-Zshell-escape",
    ]
'';
}
