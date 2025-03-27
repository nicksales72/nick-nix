{ pkgs, config, lib, ... }: {
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        $env.PATH = ($env.PATH | 
        split row (char esep) | 
        append "/home/kafka/.nix-profile/bin/marksman")
        '';
    };
  };
}
