return {
   {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
   },
   {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
         {
            "s",
            mode = { "n", "x", "o" },
            function()
               require("flash").jump()
            end,
            desc = "Flash",
         },
      },
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
      },
   },
}
