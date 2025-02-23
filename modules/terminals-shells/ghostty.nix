{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "2e3440";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
