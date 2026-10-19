{ config, ... }: let
  mod = "Mod4";

  launcher = "exec anyrun";
  term = "footclient";
  browser = "librewolf";
  fileManager = "thunar";
  music = "spotify";
  chat = "telegram";

  shotsDir = "${config.home.homeDirectory}/Pictures/Screenshots";

  up = "k";
  down = "j";
  left = "h";
  right = "l";
in
{
  wayland.windowManager.sway = {
    config = {
      modes = {
  	resize = {
	  "${up}" = "resize grow height 10px";
	  "${down}" = "resize shrink height 10px";
	  "${left}" = "resize shrink width 10px";
	  "${right}" = "resize grow width 10px";

	  "Return" = "mode default";
	  "Escape" = "mode default";
	};
      };

      keybindings = {
        "${mod}+r" = "${launcher}";

        "${mod}+q" = "exec ${term}"; 
	"${mod}+b" = "exec ${browser}";
	"${mod}+e" = "exec ${fileManager}";
	"${mod}+m" = "exec ${music}";
	"${mod}+t" = "exec ${chat}";
	
	"${mod}+c" = "kill";

	"${mod}+f" = "fullscreen toggle";

	"${mod}+${up}" = "focus up";
	"${mod}+${down}" = "focus down";
	"${mod}+${left}" = "focus left";
	"${mod}+${right}" = "focus right";

	"${mod}+Shift+${up}" = "move up";
	"${mod}+Shift+${down}" = "move down";
	"${mod}+Shift+${left}" = "move left";
	"${mod}+Shift+${right}" = "move right";

	"${mod}+1" = "workspace number 1";
	"${mod}+2" = "workspace number 2";
	"${mod}+3" = "workspace number 3";
	"${mod}+4" = "workspace number 4";
	"${mod}+5" = "workspace number 5";
	"${mod}+6" = "workspace number 6";
	"${mod}+7" = "workspace number 7";
	"${mod}+8" = "workspace number 8";
	"${mod}+9" = "workspace number 9";
	"${mod}+0" = "workspace number 10";

	"${mod}+Shift+1" = "move container to workspace number 1";
	"${mod}+Shift+2" = "move container to workspace number 2";
	"${mod}+Shift+3" = "move container to workspace number 3";
	"${mod}+Shift+4" = "move container to workspace number 4";
	"${mod}+Shift+5" = "move container to workspace number 5";
	"${mod}+Shift+6" = "move container to workspace number 6";
	"${mod}+Shift+7" = "move container to workspace number 7";
	"${mod}+Shift+8" = "move container to workspace number 8";
	"${mod}+Shift+9" = "move container to workspace number 9";
	"${mod}+Shift+0" = "move container to workspace number 10";

	"${mod}+Ctrl+h" = "splith";
	"${mod}+Ctrl+v" = "splitv";
	"${mod}+Ctrl+s" = "layout toggle split";

	"${mod}+v" = "floating toggle";

	"${mod}+Ctrl+r" = "mode resize";

	"${mod}+Shift+Tab" = "move scratchpad";
	"${mod}+Tab" = "scratchpad show";

	"XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
	"XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

	"XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
	"XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
	"XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

	"Print" = ''exec grim -g "$(slurp)" - | wl-copy'';
	"Shift+Print" = ''exec sh -c 'f="${shotsDir}/$(date +%Y-%m-%d_%H-%M-%S).png"; grim -g "$(slurp)" "$f" && wl-copy < "$f"' '';
	"${mod}+Print" = ''exec grim "${shotsDir}/$(date +%Y-%m-%d_%H-%M-%S).png"'';
	"${mod}+Shift+Print" = ''exec grim - | wl-copy'';
	"Ctrl+Print" = ''exec grim -g "$(slurp)" - | swappy -f -'';
      };
    };
  };
}
