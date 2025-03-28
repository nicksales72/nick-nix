{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "282828";
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";
      font-size = "10";
    };
  };
}
