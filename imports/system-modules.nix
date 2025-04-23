{ ... }: {
  imports = 
    builtins.map (file: ../modules/system/${file}) 
      (builtins.attrNames (builtins.readDir ../modules/system));
}
