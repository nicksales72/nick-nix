{ config, pkgs, ... }:
let
  rWithPkgs = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [ rmarkdown ];
  };
in {
  home.packages = [ rWithPkgs ];
}

