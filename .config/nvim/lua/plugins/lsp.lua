return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         require("lspconfig").tsserver.setup({})
         require("lspconfig").html.setup({})
         require("lspconfig").cssls.setup({})
      end,
   },
   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = { "tsserver", "html", "cssls", "eslint", "prettier", "stylua" },
      },
   },
   {
      "williamboman/mason-lspconfig.nvim",
   },
}
