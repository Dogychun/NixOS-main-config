{
  imports = [
    ./treesitter.nix
  ];

  programs.nixvim = {
    plugins = {
      lualine.enable = true;
      oil.enable = true;
    };
  };
}
