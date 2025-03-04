{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1a1a19";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
