require("keymaps")
require("plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true

vim.o.timeoutlen = 0

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("colorscheme catppuccin-mocha")

