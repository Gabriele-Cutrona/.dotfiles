return {
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
         require("catppuccin").setup({
            flavour = "mocha", -- or latte, frappe, macchiato
            transparent_background = true,
            term_colors = true,
            styles = {
               comments = { "italic" },
               conditionals = { "italic" },
            },
            integrations = {
               cmp = true,
               gitsigns = true,
               nvimtree = true,
               treesitter = true,
               telescope = { enabled = true },
            },
         })
         vim.cmd.colorscheme 'catppuccin'
      end,
   },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
         require("lualine").setup({
            sections = {
               lualine_a = {
                  { "filename", path = 1 }, -- 0 = just filename, 1 = relative path, 2 = absolute path
               },
            },
         })
      end,
   },
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
         "MunifTanjim/nui.nvim",
      },
   },
}
