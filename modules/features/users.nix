{ inputs, ... }: {
  flake.nixosModules.users = {
    users.users."dogychun" = {
      isNormalUser = true;
      description = "dogychun";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
      };

      users.dogychun = {
        imports = [
          ../../home/dogychun/home.nix
        ];
      };
    };
  };
}
