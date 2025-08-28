{ pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        amdvlk 
        libva  
        libva-utils
      ];
    };
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];  

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
