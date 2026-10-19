{
  programs.hyprland = {
    enable = true;

    withUWSM = true;
    xwayland.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = true;
  };
}
