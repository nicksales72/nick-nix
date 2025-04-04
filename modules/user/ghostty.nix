{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "1d2021";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "9";
    };
  };
}
