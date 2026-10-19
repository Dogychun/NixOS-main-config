{
  flake.nixosModules.thunar = { pkgs, ... }: {
    programs.thunar = {
      enable = true;

      plugins = with pkgs; [
        thunar-archive-plugin
      ];
    };

    programs.xfconf.enable = true;

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };
  };
}
