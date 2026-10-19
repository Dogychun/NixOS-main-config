{
  flake.nixosModules.stylix = { pkgs, ... }: {
    stylix = {
      enable = true;

      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
      polarity = "dark";

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
      };

      fonts = {
        sizes = {
          applications = 12;
          terminal = 12;
          desktop = 10;
          popups = 10;
        };

        monospace = {
          package = pkgs.nerd-fonts.martian-mono;
          name = "MartianMono Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
      };
    };
  };
}
