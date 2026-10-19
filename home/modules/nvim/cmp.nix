{
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;

      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
          disable_filetype = [ "TelescopePrompt" ];
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          view.docs.auto_open = false;

          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];

          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
            "<C-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
          };
        };
      };
    };

    extraConfigLua = ''
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    '';
  };
}
