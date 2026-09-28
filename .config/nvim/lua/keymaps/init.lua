Remap = vim.keymap.set
Opts = { noremap = true, silent = true }

vim.g.mapleader = " "

require("keymaps.indent")
require("keymaps.plugins")


Remap("t", "<esc>", "<C-\\><C-n>", Opts)

Remap("n", "<leader>bn", "<cmd>bn<CR>", Opts)
Remap("n", "<leader>bp", "<cmd>bp<CR>", Opts)
Remap("n", "<leader>bd", "<cmd>bd<CR>", Opts)

Remap("n", "<C-u>", "<C-u>zz", Opts)
Remap("n", "<C-d>", "<C-d>zz", Opts)

-- Remap("n", "<C-l>", "<cmd>nohlsearch<CR>", Opts)
