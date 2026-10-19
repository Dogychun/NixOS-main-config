{ pkgs, ... }: {
  home.file.".config/niri/config.kdl".source = ./modules/config.kdl;
  home.file.".config/niri/modules/rules.kdl".source = ./modules/rules.kdl;
  home.file.".config/niri/modules/binds.kdl".source = ./modules/binds.kdl;

}
