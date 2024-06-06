-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)
-- End Install lazy.nvim

-- Installing Plugins (with lazy)
require("lazy").setup({
   {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
         {
            "L3MON4D3/LuaSnip",
            build = (function()
               if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                  return
               end
               return "make install_jsregexp"
            end)(),
            dependencies = {
               {
                  "rafamadriz/friendly-snippets",
                  config = function()
                     require("luasnip.loaders.from_vscode").lazy_load()
                  end,
               },
            },
         },
         "saadparwaiz1/cmp_luasnip",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-path",
      },
      config = function()
         local cmp = require("cmp")
         local luasnip = require("luasnip")
         luasnip.config.setup({})

         cmp.setup({
            snippet = {
               expand = function(args)
                  luasnip.lsp_expand(args.body)
               end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },

            mapping = cmp.mapping.preset.insert({
               ["<C-n>"] = cmp.mapping.select_next_item(),
               ["<C-p>"] = cmp.mapping.select_prev_item(),
               ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               ["<C-f>"] = cmp.mapping.scroll_docs(4),
               ["<Tab>"] = cmp.mapping.confirm({ select = true }),
               ["<C-y>"] = cmp.mapping.complete({}),
            }),
            sources = {
               { name = "nvim_lsp" },
               { name = "luasnip" },
               { name = "path" },
               { name = "supermaven" },
            },
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
         })
      end,
   },
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
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
   },
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
         require("nvim-tree").setup({})
      end,
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
      "neovim/nvim-lspconfig",
      config = function()
         require("lspconfig").tsserver.setup({})
         require("lspconfig").html.setup({})
         require("lspconfig").cssls.setup({})
      end,
   },
   {
      "williamboman/mason.nvim",
      opts = {
         ensure_installed = { "tsserver", "html", "cssls", "eslint", "prettier", "stylua" },
      },
   },
   {
      "williamboman/mason-lspconfig.nvim",
   },
   {
      "neovim/nvim-lspconfig",
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
      "supermaven-inc/supermaven-nvim",
      config = function()
         require("supermaven-nvim").setup({})
      end,
   },
   {
      "karb94/neoscroll.nvim",
      config = function()
         require("neoscroll").setup({})
      end,
   },
   {
      "mfussenegger/nvim-lint",
      config = function()
         local lint = require("lint")

         lint.linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            svelte = { "eslint" },
         }

         vim.keymap.set("n", "<Space>le", function()
            lint.try_lint()
         end, { desc = "Trigger eslint for current file" })
      end,
   },
   {
      "stevearc/conform.nvim",
      config = function()
         local conform = require("conform")

         conform.setup({
            formatters_by_ft = {
               lua = { "stylua" },
               svelte = { { "prettier" } },
               javascript = { { "prettier" } },
               typescript = { { "prettier" } },
               javascriptreact = { { "prettier" } },
               typescriptreact = { { "prettier" } },
               json = { { "prettier" } },
               graphql = { { "prettier" } },
               markdown = { { "prettier" } },
               html = { "prettier" },
               css = { { "prettier" } },
               scss = { { "prettier" } },
            },
         })

         vim.keymap.set({ "n", "v" }, "<Space>lp", function()
            conform.format({
               lsp_fallback = true,
               async = false,
               timeout_ms = 1000,
            })
         end, { desc = "Format file or range (in visual mode)" })
      end,
   },
   {
      "folke/noice.nvim",
      event = "VeryLazy",
      opts = {
         -- add any options here
      },
      dependencies = {
         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
         "MunifTanjim/nui.nvim",
         -- OPTIONAL:
         --   `nvim-notify` is only needed, if you want to use the notification view.
         --   If not available, we use `mini` as the fallback
         "rcarriga/nvim-notify",
      },
   },
   {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      opts = {},
   },
   {
      "lewis6991/gitsigns.nvim",
   }
})
-- End Installing Plugins (with lazy)

-- (Neo)Vim Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("colorscheme catppuccin-mocha")
-- End (Neo)Vim Options

-- Keymaps
remap = vim.api.nvim_set_keymap
remap("n", "<Space>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
remap("n", "<Space>f", "<cmd>NvimTreeFocus<CR>", { noremap = true, silent = true })

function _G.check_prev_char()
   local line = vim.api.nvim_get_current_line()
   local col = vim.api.nvim_win_get_cursor(0)[2] + 1
   if col > 1 and line:sub(col - 1, col - 1) == "j" then
      -- Use nvim_replace_termcodes to interpret "<BS><Esc>" correctly
      return vim.api.nvim_replace_termcodes("<BS><C-\\><C-n>", true, true, true)
   else
      return "k"
   end
end

remap("i", "k", "v:lua.check_prev_char()", { expr = true, noremap = true })
remap("t", "<Tab>", "<C-\\><C-n>", { noremap = true, silent = true })

remap("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
remap("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
remap("n", "<Space>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

remap("n", "]", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
remap("n", "[", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.o.timeoutlen = 100

remap(
   "n",
   "<Space>i",
   "<cmd>set tabstop=2 | set shiftwidth=2 | set softtabstop=2<CR>",
   { noremap = true, silent = true }
)
remap(
   "n",
   "<Space>o",
   "<cmd>set tabstop=3 | set shiftwidth=3 | set softtabstop=3<CR>",
   { noremap = true, silent = true }
)
remap(
   "n",
   "<Space>p",
   "<cmd>set tabstop=4 | set shiftwidth=4 | set softtabstop=4<CR>",
   { noremap = true, silent = true }
)
-- End Keymaps

-- Plugins Setup
vim.opt.termguicolors = true
require("bufferline").setup({})

require("lualine").setup()

vim.cmd("TSInstall all")

require("nvim-treesitter.configs").setup({
   autotag = {
      enable = true,
   },
})

require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 0,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

vim.cmd("set pumheight=10")

-- End Plugins Setup
