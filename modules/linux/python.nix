{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    python313
    uv
    ruff
    pyright
  ];
}
