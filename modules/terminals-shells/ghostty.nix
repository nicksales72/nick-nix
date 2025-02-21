{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "2D353B";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
