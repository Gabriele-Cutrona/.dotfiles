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
      "epwalsh/obsidian.nvim",
      version = "*",
      lazy = true,
      ft = "markdown",
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      opts = {
         workspaces = {
            {
               name = "everything",
               path = vim.fn.getcwd(),
            },
         },
         disable_frontmatter = true,
      },
   },
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
         require("nvim-treesitter.configs").setup({
            auto_install = true,
            autotag = {
               enable = true,
            },
            hightlight = { enable = true },
            indent = { enable = true },
         })
      end,
   },
   {
      "elkasztano/nushell-syntax-vim",
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
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({})
      end,
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
      config = function()
         require("gitsigns").setup({
            signs = {
               add = { text = "+" },
               change = { text = "┃" },
               delete = { text = "_" },
               topdelete = { text = "‾" },
               changedelete = { text = "~" },
               untracked = { text = "┆" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
               follow_files = true,
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
               virt_text = true,
               virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
               delay = 0,
               ignore_whitespace = false,
               virt_text_priority = 100,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            preview_config = {
               -- Options passed to nvim_open_win
               border = "single",
               style = "minimal",
               relative = "cursor",
               row = 0,
               col = 1,
            },
         })
         vim.cmd("set pumheight=10")
      end,
   },
}
