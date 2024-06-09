return {
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
   },
   {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
   },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
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
         "rcarriga/nvim-notify",
      },
   },
}
