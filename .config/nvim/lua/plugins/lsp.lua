return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lsp = require("lspconfig")
         lsp.ts_ls.setup({})
         lsp.html.setup({})
         lsp.cssls.setup({})
         lsp.lua_ls.setup({})
         require("lspconfig").nixd.setup({
            cmd = { "nixd" },
            settings = {
               nixd = {
                  formatting = {
                     command = { "alejandra" }, -- or nixpkgs-fmt or nixfmt
                  },
               },
            },
         })
      end,
   },
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup({})
         -- vim.cmd("MasonInstall prettier")
         -- vim.cmd("MasonInstall stylua")
         -- vim.cmd("MasonInstall biome")
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "ts_ls", "html", "cssls", "eslint", "lua_ls", "biome" },
         })
      end,
   },
   {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
   },
}
