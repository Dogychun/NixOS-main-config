{
  programs.mangohud = {
    enable = true;

    settings = {
      fps = true;

      gpu_stats = true;
      gpu_temp = true;
      vram = true;

      cpu_stats = true;
      cpu_temp = true;

      ram = true;

      position = "top-left";
      font-size = 16;

      toggle_hud = "Shift+F12";
    };
  };
}
