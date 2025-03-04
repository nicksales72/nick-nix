{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "24272B";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
