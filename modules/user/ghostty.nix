{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "161616";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "9";
    };
  };
}
