return {
   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
         vim.o.timeout = true
         vim.o.timeoutlen = 300
      end,
      opts = {},
   },
   {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true,
   },
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
   },
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
   },
   {
      "windwp/nvim-ts-autotag",
   },
   {
      "kdheepak/lazygit.nvim",
      cmd = {
         "LazyGit",
         "LazyGitConfig",
         "LazyGitCurrentFile",
         "LazyGitFilter",
         "LazyGitFilterCurrentFile",
      },
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {},
   },
   {
      "lewis6991/gitsigns.nvim",
   },
}
