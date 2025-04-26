vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.o.timeoutlen = 100

vim.cmd("set clipboard+=unnamedplus")

vim.opt.cursorline = true  -- Highlights the whole line
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b4befe", bold = true })
