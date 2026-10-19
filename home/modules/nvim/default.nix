{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./plugins

    ./lsp.nix
    ./cmp.nix

    ./keymap.nix
  ];

  programs.nixvim = {
    enable = true;

    colorschemes.gruvbox = {
      enable = true;

      settings = {
        bold = false;
	contrast = "medium";
      };
    };


    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      cursorline = true;

      termguicolors = true;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
    };
  };
}
