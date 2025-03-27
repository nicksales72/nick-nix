{ config, lib, pkgs, ... }: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;  
      extraPackages = with pkgs; [
        amdvlk 
        rocm-opencl-icd  
        rocm-opencl-runtime
        libva  
        libva-utils
      ];
    };
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];  

  services.power-profiles-daemon.enable = false;  # Conflicts with TLP

  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
    defaultSession = "sway";
  };

  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "sway";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
