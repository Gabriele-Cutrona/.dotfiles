return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lsp = require("lspconfig")
         lsp.tsserver.setup({})
         lsp.html.setup({})
         lsp.cssls.setup({})
         lsp.lua_ls.setup({})

         remap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
         remap({ "n", "v" }, "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})
      end,
   },
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup({
            ensure_installed = { "prettier", "stylua" },
         })
      end,
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = { "tsserver", "html", "cssls", "eslint", "lua_ls" },
         })
      end,
   },
}
