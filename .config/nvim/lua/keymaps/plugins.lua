remap("n", "<Space>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
remap("n", "<Space>f", "<cmd>NvimTreeFocus<CR>", { noremap = true, silent = true })

remap("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
remap("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
remap("n", "<Space>lg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })

remap("n", "]", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
remap("n", "[", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
