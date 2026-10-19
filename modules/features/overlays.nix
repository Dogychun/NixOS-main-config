{
  flake.nixosModules.overlays = { lib, pkgs, ... }: {
    nixpkgs.overlays = [
      (final: prev: {
        xwayland-satellite = prev.xwayland-satellite.overrideAttrs (old: rec {
          version = "0.8.1";
          src = final.fetchFromGitHub {
            owner = "Supreeeme";
            repo = "xwayland-satellite";
            tag = "v${version}";
            hash = "sha256-BUE41HjLIGPjq3U8VXPjf8asH8GaMI7FYdgrIHKFMXA=";
          };
          cargoHash = lib.fakeHash;
        });
      })
    ];
  };
}
