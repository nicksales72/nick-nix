{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "282828";
      background-opacity = "0.9";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "9";
    };
  };
}
