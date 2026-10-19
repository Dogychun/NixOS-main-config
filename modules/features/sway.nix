{
  flake.nixosModules.sway = { pkgs, ... }: {
    programs.sway = {
      enable = true;

      xwayland.enable = true;

      extraOptions = [
        "--unsupported-gpu"
      ];
    };
  };
}
