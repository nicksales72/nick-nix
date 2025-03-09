{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    uv
    (python313.withPackages (ps: with ps; [
      numpy
      matplotlib
      jupyterlab
      pandas
      graphviz
    ]))
  ];
}
