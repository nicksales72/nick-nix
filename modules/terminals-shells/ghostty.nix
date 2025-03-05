{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "181818";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
