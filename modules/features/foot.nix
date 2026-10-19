{
  flake.nixosModules.foot = {
    programs.foot = {
      enable = true;

      theme = "gruvbox-dark";

      settings = {
        main = {
	  font = "MartianMono Nerd Font:size=12";
	  dpi-aware = "no";
	};

	cursor = {
	  style = "block";
	  blink = "no";
	};

	mouse = {
	  hide_when_typing = "no";
	};
      };
    };
  };
}
