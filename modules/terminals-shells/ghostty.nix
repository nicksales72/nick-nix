{ pkgs, config, ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      background = "282828";
    };
  };
}
