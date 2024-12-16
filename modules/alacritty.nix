{ pkgs, config, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      terminal = {
        shell = {
          program = "${pkgs.nushell}/bin/nu";
          args = [];
        };
      };
    };
  };
}

