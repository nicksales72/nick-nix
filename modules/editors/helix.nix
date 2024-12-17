{ config, pkgs, lib, ... }: {
  home.packages = [
    pkgs.helix
  ];

  home.file.".config/helix/config.toml".text = ''
    theme = "ferra"

    [editor]
    line-number = "relative"
    mouse = false

    [editor.cursor-shape]
    insert = "bar"
    normal = "block"
    select = "underline"

    [editor.file-picker]
    hidden = false
  '';
}

