{ pkgs, config, ... }: {
  wayland.windowManager.niri = {
    enable = true;

    systemd.enable = true;
    xwaylandSatellitePackage = pkgs.xwayland-satellite;

    settings = {
      binds = {
        "Mod+Q".spawn = "kitty";
        "Mod+B".spawn = "librewolf";
        "Mod+E".spawn = "thunar";

        "Mod+R".spawn = [ "noctalia" "msg" "panel-toggle" "launcher" ];

        "Mod+V".toggle-window-floating = { };
        "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };

        "Mod+H".focus-column-left = { };
        "Mod+L".focus-column-right = { };
        "Mod+K".focus-window-up = { };
        "Mod+J".focus-window-down = { };

        "Mod+Shift+H".move-column-left = { };
        "Mod+Shift+L".move-column-right = { };
        "Mod+Shift+K".move-window-up = { };
        "Mod+Shift+J".move-window-down = { };

        "Mod+Ctrl+H".focus-monitor-left = { };
        "Mod+Ctrl+L".focus-monitor-right = { };
        "Mod+Ctrl+K".focus-monitor-up = { };
        "Mod+Ctrl+J".focus-monitor-down = { };

        "Mod+Shift+Ctrl+H".move-column-to-monitor-left = { };
        "Mod+Shift+Ctrl+L".move-column-to-monitor-right = { };
        "Mod+Shift+Ctrl+K".move-column-to-monitor-up = { };
        "Mod+Shift+Ctrl+J".move-column-to-monitor-down = { };

        "Mod+F".maximize-column = { };
        "Mod+Shift+F".fullscreen-window = { };

        "Mod+Tab".consume-window-into-column = { };
        "Mod+Shift+Tab".expel-window-from-column = { };

        "Mod+Alt+H".set-column-width = "-5%";
        "Mod+Alt+L".set-column-width = "+5%";
        "Mod+Alt+K".set-window-height = "-5%";
        "Mod+Alt+J".set-window-height = "+5%";

        "Mod+O".toggle-overview = { };

        "Mod+C".close-window = { };

        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+0".focus-workspace = 10;

        "Mod+Shift+1".move-column-to-workspace = 1;
        "Mod+Shift+2".move-column-to-workspace = 2;
        "Mod+Shift+3".move-column-to-workspace = 3;
        "Mod+Shift+4".move-column-to-workspace = 4;
        "Mod+Shift+5".move-column-to-workspace = 5;
        "Mod+Shift+6".move-column-to-workspace = 6;
        "Mod+Shift+7".move-column-to-workspace = 7;
        "Mod+Shift+8".move-column-to-workspace = 8;
        "Mod+Shift+9".move-column-to-workspace = 9;
        "Mod+Shift+0".move-column-to-workspace = 10;

        "XF86AudioRaiseVolume".spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" "-l" "1.0" ];
        "XF86AudioLowerVolume".spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
        "XF86AudioMute".spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];

        "XF86MonBrightnessUp".spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
        "XF86MonBrightnessDown".spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];

        "Print".screenshot = {};
      };

      recent-windows = {
        off = { };
      };

      hotkey-overlay = {
        skip-at-startup = { };
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      prefer-no-csd = { };


      cursor = {
        xcursor-theme = config.home.pointerCursor.name;
        xcursor-size = config.home.pointerCursor.size;
      };

      input = {
        touchpad = {
          scroll-method = "two-finger";
          tap = { };
        };

        keyboard = {
          xkb = {
            layout = "us,ru";
            options = "grp:alt_shift_toggle";
          };
        };

        mouse = {
          accel-profile = "flat";
        };
      };

      gestures = {
        hot-corners = {
          off = { };
        };
      };

      layout = {
        gaps = 6;

        focus-ring = {
          width = 2;
          active-color = "#B8BB26";
        };

        border = {
          off = {};
        };

        always-center-single-column = { };
      };
    };

    extraConfig = ''
      debug {
        honor-xdg-activation-with-invalid-serial        
      }

      window-rule {
        match app-id="net.lutris.Lutris"
        open-maximized true
        open-on-workspace "laptop-games"
      }

      window-rule {
        match app-id="librewolf"
        open-maximized true
        open-on-workspace "DP-1-browser"
      }

      window-rule {
        match app-id="kitty"
        open-on-workspace "laptop-code"
      }

      window-rule {
        match app-id="steam"
        open-maximized true
        open-on-workspace "laptop-games"
      }

      window-rule {
        match app-id="telegram"
        open-maximized true
        open-on-workspace "laptop-chats"
      }

      window-rule {
        match app-id="Spotify"
        open-maximized true
        open-on-workspace "DP-1-music"
      }

      output "eDP-1" {
        mode "1920x1080@144"
        scale 1
        transform "normal"
        position x=0 y=0
      }

      output "DP-1" {
        mode "1920x1080@60"
        scale 1
        transform "normal"
        position x=-1920 y=0
      }

      spawn-at-startup "noctalia"

      workspace "laptop-browser" {
          open-on-output "eDP-1"
      }
      workspace "laptop-code" {
          open-on-output "eDP-1"
      }
      workspace "laptop-chats" {
          open-on-output "eDP-1"
      }
      workspace "laptop-games" {
          open-on-output "eDP-1"
      }
      workspace "laptop-music" {
          open-on-output "eDP-1"
      }

      workspace "DP-1-browser" {
          open-on-output "DP-1"
      }
      workspace "DP-1-code" {
          open-on-output "DP-1"
      }
      workspace "DP-1-chats" {
          open-on-output "DP-1"
      }
      workspace "DP-1-games" {
          open-on-output "DP-1"
      }
      workspace "DP-1-music" {
          open-on-output "DP-1"
      }
    '';
  };
}
