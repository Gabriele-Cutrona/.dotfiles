remap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
remap("n", "<Leader>f", "<cmd>NvimTreeFocus<CR>", { noremap = true, silent = true })

remap("n", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
remap("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
remap("n", "<Leader>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

remap("n", "]", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
remap("n", "[", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>le", function()
   lint.try_lint()
end, { desc = "Trigger eslint for current file" })

vim.keymap.set({ "n", "v" }, "<Leader>lp", function()
   conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
   })
end, { desc = "Format file or range (in visual mode)" })

remap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
remap("n", "<C-g>", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
remap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
