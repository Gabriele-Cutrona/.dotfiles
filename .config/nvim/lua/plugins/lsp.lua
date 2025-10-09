return {
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lsp = vim.lsp.enable
			lsp("ts_ls")
			lsp("html")
			lsp("lua_ls")
			lsp("ruff")
			lsp("pyright")
			lsp("rust_analyzer")
			lsp("tailwindcss")
			lsp("svelte")
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
            ensure_installed = {
               "ts_ls",
               "html",
               "cssls",
               "eslint",
               "lua_ls",
               "biome",
               "pyright",
               "ruff",
               "rust_analyzer",
               "tailwindcss",
               "svelte",
					"clangd"
            },
         })
      end,
   },
   {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
   },
	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = {"nvim-treesitter/nvim-treesitter"}
	}
}
