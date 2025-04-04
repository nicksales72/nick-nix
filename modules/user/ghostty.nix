{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "2d353b";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "9";
    };
  };
}
