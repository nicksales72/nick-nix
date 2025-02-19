{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1C1C1C";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
