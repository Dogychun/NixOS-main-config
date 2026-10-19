{ pkgs, ... }: {
  programs.i3status = {
    enable = true;

    general = {
      output_format = "i3bar";
      colors = true;
      interval = 5;
      color_good = "#b8bb26";
      color_degraded = "#fabd2f";
      color_bad = "#fb4934";
    };

    modules = {
      "ipv6".enable = false;
      "ethernet _first_".enable = false;

      "wireless _first_" = {
        enable = true;
	position = 7;
	settings = {
	  format_up = "W: %quality %essid";
	  format_down = "W: down";
	};
      };

      "battery all" = {
        enable = true;
	position = 8;
	settings = {
	  format = "%status %percentage %remaining";
	  integer_battery_capacity = true;

	  status_chr = "CHR";
	  status_bat = "BAT";
	  status_full = "FULL";
	  status_idle = "IDLE";
	  status_unk = "UNK";

	  low_threshold = 20;
	  threshold_type = "percentage";
	};
      };

      "disk /" = {
        enable = false;
	position = 5;
      };

      "cpu_usage" = {
        position = 4;
	settings = {
	  format = "CPU %usage";
	  degraded_threshold = 70;
	  max_threshold = 90;
	};
      };

      "memory" = {
        position = 3;
	settings = {
	  format = "RAM %used";
	  threshold_degraded = "10%";
	  format_degraded = "RAM LOW %free";
	};
      };

      "volume master" = {
        position = 6;
	settings = {
	  format = "VOL %volume";
	  format_muted = "VOL muted";
	  device = "pulse";
	};
      };

      "tztime local" = {
        position = 9;
	settings.format = "%a %d %b %H:%M";
      };
    };
  };

  wayland.windowManager.sway = {
    config.bars = [
      {
        position = "top";
	statusCommand = "${pkgs.i3status}/bin/i3status";

	fonts = {
	  names = [ "MartianMono Nerd Font" ];
	  size = 10.0;
	};

	trayOutput = "*";

	colors = {
	  background = "#282828";
	  statusline = "#ebdbb2";
	  separator = "#a89984";

	  focusedWorkspace = {
	    border = "#b8bb26";
	    background = "#b8bb26";
	    text = "#282828";
	  };
	  activeWorkspace = {
	    border = "#fabd2f";
	    background = "#fabd2f";
	    text = "#282828";
	  };
	  inactiveWorkspace = {
	    border = "#282828";
	    background = "#282828";
	    text = "#ebdbb2";
	  };
	  urgentWorkspace = {
	    border = "#fb4934";
	    background = "#fb4934";
	    text = "#282828";
	  };
	};

 	extraConfig = ''
	  tray_bindsym button3 ContextMenu
	  tray_bindsym button1 Activate
	'';
      } 
    ];
  };
}
