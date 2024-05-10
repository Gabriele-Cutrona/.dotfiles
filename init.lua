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
require('lazy').setup({
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
           {
             'rafamadriz/friendly-snippets',
             config = function()
               require('luasnip.loaders.from_vscode').lazy_load()
             end,
           },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.confirm { select = true },
          ['<C-y>'] = cmp.mapping.complete {},
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
  {
   "folke/which-key.nvim",
   event = "VeryLazy",
   init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
   end,
   opts = {}
  },
  {
     "akinsho/toggleterm.nvim",
     version = "*",
     config = true
  },
  {
     "nvim-telescope/telescope.nvim",
     dependencies = { "nvim-lua/plenary.nvim" }
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
     priority = 1000
  },
  {
     "akinsho/bufferline.nvim",
     version = "*",
     dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
     "nvim-lualine/lualine.nvim",
     dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
     "nvim-treesitter/nvim-treesitter",
     build = ":TSUpdate"
  },
  {
     "nvim-tree/nvim-tree.lua",
     version = "*",
     lazy = false,
     dependencies = "nvim-tree/nvim-web-devicons",
     config = function()
        require("nvim-tree").setup{}
     end,
  },
  {
     "windwp/nvim-autopairs",
     event = "InsertEnter",
     config = true
  },
  {
     "windwp/nvim-ts-autotag"
  },
  {
     "neovim/nvim-lspconfig",
     config = function()
        require("lspconfig").tsserver.setup{}
     end,
  },
  {
     "williamboman/mason.nvim"
  },
  {
     "williamboman/mason-lspconfig.nvim"
  },
  {
     "neovim/nvim-lspconfig"
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
vim.api.nvim_set_keymap("n", "<Space>e", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Space>t", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Space>i", "<cmd>set tabstop=2 | set shiftwidth=2 | set softtabstop=2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Space>o", "<cmd>set tabstop=3 | set shiftwidth=3 | set softtabstop=3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Space>p", "<cmd>set tabstop=4 | set shiftwidth=4 | set softtabstop=4<CR>", {noremap = true, silent = true})
-- End Keymaps

-- Plugins Setup
vim.opt.termguicolors = true
require("bufferline").setup{}

require("lualine").setup()

vim.cmd("TSInstall all")

require"nvim-treesitter.configs".setup {
   autotag = {
      enable = true,
   }
}

require("mason").setup()
require("mason-lspconfig").setup({
   ensure_installed = { "tsserver", "html" }
})

-- End Plugins Setup
