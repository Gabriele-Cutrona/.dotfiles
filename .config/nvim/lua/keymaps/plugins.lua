Remap("n", "<Leader>e", "<cmd>Neotree toggle<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>f", "<cmd>Neotree<CR>", { noremap = true, silent = true })

Remap("n", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

Remap("n", "]", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
Remap("n", "[", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

Remap("n", "<Leader>lea", function()
   require("lint").try_lint()
end, { desc = "Trigger lint for current file" })

Remap("n", "<Leader>lee", function()
   require("lint").try_lint("eslint")
end, { desc = "Trigger eslint for current file" })

Remap("n", "<Leader>leb", function()
   require("lint").try_lint("biomejs")
end, { desc = "Trigger biomejs for current file" })

Remap({ "n", "v" }, "<Leader>lpa", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
   })
end, { desc = "Format file or range" })

Remap({ "n", "v" }, "<Leader>lpp", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
      formatters = { "prettier" },
   })
end, { desc = "Format file or range with prettier" })

Remap({ "n", "v" }, "<Leader>lpb", function()
   require("conform").format({
      lsp_fallback = true,
      async = false,
      formatters = { "biome" },
   })
end, { desc = "Format file or range with biome" })

Remap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>p", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
Remap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>g", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
Remap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true, silent= true })

Remap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
Remap({ "n", "v" }, "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})

Remap("n", "<Leader>td", "<cmd>Trouble diagnostics toggle<CR>", {})
