{ config, lib, pkgs, ... }: {  
  home.packages = with pkgs; [
    (octave.withPackages (opkgs: with opkgs; [ symbolic ]))
  ];
}

