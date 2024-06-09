return {
   {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
   },
   {
      "ggandor/leap.nvim",
      config = function()
         require("leap").create_default_mappings()
      end,
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
         "MunifTanjim/nui.nvim",
         "3rd/image.nvim",
      },
   },
}
