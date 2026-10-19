{
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader><S-e>";
        mode = [ "n" ];
        action = "<cmd>Oil<Cr>";
      }
    ];
  };
}
