-- Froms spaces to tabs: <Leader>i<number>, <Leader>it, <Leader>ir
-- Froms tabs to spaces: <Leader>i<number>, <Leader>is, <Leader>ir

remap(
   "n",
   "<Leader>i2",
   "<cmd>set tabstop=2 | set shiftwidth=2 | set softtabstop=2<CR>",
   { noremap = true, silent = true }
)
remap(
   "n",
   "<Leader>i3",
   "<cmd>set tabstop=3 | set shiftwidth=3 | set softtabstop=3<CR>",
   { noremap = true, silent = true }
)
remap(
   "n",
   "<Leader>i4",
   "<cmd>set tabstop=4 | set shiftwidth=4 | set softtabstop=4<CR>",
   { noremap = true, silent = true }
)

remap("n", "<Leader>is", "<cmd>lua vim.opt.expandtab=true<CR>", { noremap = true, silent = true })
remap("n", "<Leader>it", "<cmd>lua vim.opt.expandtab=false<CR>", { noremap = true, silent = true })

remap("n", "<Leader>ir", "<cmd>%retab!<CR>", { noremap = true, silent = true })
