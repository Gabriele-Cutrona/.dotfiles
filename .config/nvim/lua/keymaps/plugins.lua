remap("n", "<Leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
remap("n", "<Leader>f", "<cmd>Neotree<CR>", { noremap = true, silent = true })

remap("n", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
remap("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
remap("n", "<Leader>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

remap("n", "]", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
remap("n", "[", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

remap("n", "<Leader>lea", function()
   require("lint").try_lint()
end, { desc = "Trigger lint for current file" })

remap("n", "<Leader>lee", function()
   require("lint").try_lint("eslint")
end, { desc = "Trigger eslint for current file" })

remap("n", "<Leader>leb", function()
   require("lint").try_lint("biomejs")
end, { desc = "Trigger biomejs for current file" })

remap({ "n", "v" }, "<Leader>lpa", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
   })
end, { desc = "Format file or range" })

remap({ "n", "v" }, "<Leader>lpp", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
      formatters = { "prettier" },
   })
end, { desc = "Format file or range with prettier" })

remap({ "n", "v" }, "<Leader>lpb", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
      formatters = { "biome" },
   })
end, { desc = "Format file or range with biome" })

remap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
remap("n", "<Leader>p", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
remap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
remap("n", "<Leader>g", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
remap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
remap("n", "<Leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true, silent= true })

remap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
remap({ "n", "v" }, "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})

remap("n", "<Leader>td", "<cmd>Trouble diagnostics toggle<CR>", {})
