return {
   {
      "mfussenegger/nvim-lint",
      config = function()
         require("lint").linters_by_ft = {
            javascript = { "eslint", "biomejs" },
            typescript = { "eslint", "biomejs" },
            javascriptreact = { "eslint", "biomejs" },
            typescriptreact = { "eslint", "biomejs" },
            svelte = { "eslint", "biomejs" },
         }
      end,
   },
   {
      "stevearc/conform.nvim",
      config = function()
         require("conform").setup({
            formatters_by_ft = {
               lua = { "stylua" },
               svelte = { "prettier", "biome" },
               javascript = { "prettier", "biome" },
               typescript = { "prettier", "biome" },
               javascriptreact = { "prettier", "biome" },
               typescriptreact = { "prettier", "biome" },
               json = { "prettier", "biome" },
               graphql = { "prettier", "biome" },
               markdown = { "prettier", "biome" },
               html = { "prettier", "biome" },
               css = { "prettier", "biome" },
               scss = { "prettier", "biome" },
            },
         })
      end,
   },
}
