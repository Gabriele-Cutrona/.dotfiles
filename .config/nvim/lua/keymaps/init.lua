Remap = vim.keymap.set
vim.g.mapleader = " "

require("keymaps.indent")
require("keymaps.plugins")

Remap("t", "<Tab>", "<C-\\><C-n>", { noremap = true, silent = true })

Remap("n", "<leader>bn", "<cmd>bn<CR>", { noremap = true, silent = true })
Remap("n", "<leader>bp", "<cmd>bp<CR>", { noremap = true, silent = true })
Remap("n", "<leader>bd", "<cmd>bd<CR>", { noremap = true, silent = true })

Remap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
Remap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
