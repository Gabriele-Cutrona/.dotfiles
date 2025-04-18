return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lsp = require("lspconfig")
         lsp.ts_ls.setup({})
         lsp.html.setup({})
         lsp.cssls.setup({})
         lsp.lua_ls.setup({})
      end,
   },
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup({})
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
