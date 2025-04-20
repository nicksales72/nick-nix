{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "ffdab9";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "9";
    };
  };
}
