{ ... }: {
  imports = 
    builtins.map (file: ../modules/user/${file}) 
      (builtins.attrNames (builtins.readDir ../modules/user));
}
