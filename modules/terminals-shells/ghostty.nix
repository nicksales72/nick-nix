{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1D1D1D";
      cursor-style = "block";
      cursor-style-blink = "false";
    };
  };
}
