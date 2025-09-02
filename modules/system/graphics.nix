{ ... }: {
  hardware.opengl.enable = true;

  services.xserver.videoDrivers = [
    "amdgpu" 
    "nvidia"  
  ];

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;

    powerManagement.enable = true;          
    powerManagement.finegrained = true;      
    nvidiaSettings = true;                   
  };

  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true; 
    amdgpuBusId  = "PCI:5:0:0";   
    nvidiaBusId  = "PCI:1:0:0";    
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.blacklistedKernelModules = [ "nouveau" ];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
