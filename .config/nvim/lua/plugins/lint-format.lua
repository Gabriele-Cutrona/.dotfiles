return {
   {
      "mfussenegger/nvim-lint",
      config = function()
         require("lint").linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            svelte = { "eslint" },
         }
      end,
   },
   {
      "stevearc/conform.nvim",
      config = function()
         require("conform").setup({
            formatters_by_ft = {
               lua = { "stylua" },
               svelte = { "prettier" },
               javascript = { "prettier" },
               typescript = { "prettier" },
               javascriptreact = { "prettier" },
               typescriptreact = { "prettier" },
               json = { "prettier" },
               graphql = { "prettier" },
               markdown = { "prettier" },
               html = { "prettier" },
               css = { "prettier" },
               scss = { "prettier" },
            },
         })
      end,
   },
}
