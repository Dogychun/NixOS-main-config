{
  flake.nixosModules.kdePlasma = { lib, ... }: {
    services = {
      displayManager.sddm.enable = true;
      displayManager.defaultSession = lib.mkForce "niri";

      desktopManager.plasma6.enable = true;

      xserver.enable = true;
    };
  };
}
