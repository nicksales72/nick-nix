{ pkgs, config, lib, ... }: {
  programs = {
    nushell = {
      enable = true;
    };
  };
}
