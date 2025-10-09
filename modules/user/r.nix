{ pkgs, ... }:
let
  rWithPkgs = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [ rmarkdown pandoc ];
  };
in {
  home.packages = [ rWithPkgs ];
}

