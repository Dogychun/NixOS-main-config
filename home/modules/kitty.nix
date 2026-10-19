{
  programs.kitty = {
    enable = true;

    themeFile = "gruvbox-dark";

    settings = {
      font_family = "MartianMono Nerd Font Mono";
      font_size = 12;

      cursor_shape = "block";
      cursor_blink_interval = 0;

      scrollbar = "never";
      scrollbar_interactive = "no";

      sync_to_monitor = "no";
      input_delay = 3;

      remember_window_size = "no";
      remember_window_position = "no";
      confirm_os_window_close = 0;
    };
  };
}
