{
  flake.nixosModules.steam = { pkgs, ... }: {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = false;
      };

      gamemode.enable = true;
    };

  };
}
