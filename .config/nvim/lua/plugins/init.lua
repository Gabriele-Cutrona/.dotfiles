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
            completion = { completeopt = "menu,menuone,noinsert,noselect" },

            mapping = cmp.mapping.preset.insert({
               ["<C-n>"] = cmp.mapping.select_next_item(),
               ["<C-p>"] = cmp.mapping.select_prev_item(),
               ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               ["<C-f>"] = cmp.mapping.scroll_docs(4),
               ["<Tab>"] = cmp.mapping.confirm(),
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

require("plugins.setplugins")

