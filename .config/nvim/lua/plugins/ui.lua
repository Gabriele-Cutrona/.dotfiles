return {
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
         vim.cmd("colorscheme catppuccin-latte")
      end,
   },
   -- {
   --    "akinsho/bufferline.nvim",
   --    version = "*",
   --    dependencies = "nvim-tree/nvim-web-devicons",
   --    config = function()
   --       require("bufferline").setup({})
   --    end,
   -- },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
         require('lualine').setup {
            sections = {
               lualine_a = {
                  { 'filename', path = 1 }, -- 0 = just filename, 1 = relative path, 2 = absolute path
               },
            },
         }
      end,
   },
   -- {
   --    "karb94/neoscroll.nvim",
   --    config = function()
   --       require("neoscroll").setup({})
   --    end,
   -- },
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
