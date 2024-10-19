return {
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
         vim.cmd("colorscheme catppuccin-mocha")
      end,
   },
   {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
         require("bufferline").setup({})
      end,
   },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
         require("lualine").setup()
      end,
   },
   {
      "karb94/neoscroll.nvim",
      config = function()
         require("neoscroll").setup({})
      end,
   },
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
         "MunifTanjim/nui.nvim",
         -- "rcarriga/nvim-notify",
      },
   },
}
