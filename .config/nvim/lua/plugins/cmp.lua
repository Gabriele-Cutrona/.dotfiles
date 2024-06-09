return {
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
      "supermaven-inc/supermaven-nvim",
      config = function()
         require("supermaven-nvim").setup({})
      end,
   },
}
