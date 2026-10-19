{
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts

      nerd-fonts.martian-mono
    ];
  };
}
