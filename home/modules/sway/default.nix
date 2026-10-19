{
  imports = [
    ./binds.nix
    ./bars.nix
    ./colors.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;

    extraOptions = [
      "--unsupported-gpu"
    ];

    config = {
      focus = {
        followMouse = false;
	mouseWarping = false;
	newWindow = "focus";
      };

      workspaceOutputAssign = [
        { workspace = "1"; output = "eDP-1"; }
        { workspace = "2"; output = "eDP-1"; }
        { workspace = "3"; output = "eDP-1"; }
        { workspace = "4"; output = "eDP-1"; }
        { workspace = "5"; output = "eDP-1"; }
        { workspace = "6"; output = "DP-1"; }
        { workspace = "7"; output = "DP-1"; }
        { workspace = "8"; output = "DP-1"; }
        { workspace = "9"; output = "DP-1"; }
        { workspace = "10"; output = "DP-1"; }
      ];

      input = {
        "type:keyboard" = {
	  xkb_layout = "us,ru";
	  xkb_options = "grp:alt_shift_toggle";
	};
	"type:pointer" = {
	  accel_profile = "flat";
	  pointer_accel = "0";
	};
	"type:touchpad" = {
	  accel_profile = "flat";
	  tap = "enabled";
	  natural_scroll = "disabled";
	};
      };

      gaps = {
	outer = 6;
	inner = 6;
      };

      window = {
        border = 2;
	titlebar = false;
      };

      floating = {
	border = 2;
	titlebar = false;
      };

      output = {
        "eDP-1" = {
	  mode = "1920x1080@144.001Hz";
	  position = "1920 0";
	  scale = "1";
	};

	"DP-1" = {
	  mode = "1920x1080@60.000Hz";
	  position = "0 0";
	  scale = "1";
	};
        "*".bg = "${./mountains.png} fill";
       };
    };
  };
}
