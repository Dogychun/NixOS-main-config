{
  flake.nixosModules.nix = { pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      alejandra
      nil
      nixd
    ];
  };
}
