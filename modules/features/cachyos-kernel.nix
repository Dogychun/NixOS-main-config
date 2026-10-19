{ inputs, ... }: {
  flake.nixosModules.cachyos-kernel = { inputs, pkgs, config, ... }: {
    nixpkgs.overlays = [
      inputs.nix-cachyos-kernel.overlays.pinned
    ];

    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;

    nix.settings = {
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
    };
  };
}
