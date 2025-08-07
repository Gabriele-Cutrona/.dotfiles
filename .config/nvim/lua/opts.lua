vim.opt.number = true
vim.opt.relativenumber = true

-- Note the three space indenting used in this project, much like that used by other superior beings.
-- - The Arch Wiki (https://wiki.archlinux.org/title/Arch_is_the_best)
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

vim.opt.termguicolors = true

vim.opt.fillchars = { eob = " " }

vim.o.timeoutlen = 100

vim.cmd("set clipboard+=unnamedplus")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.o.pumblend = 0
vim.o.winblend = 0
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "none" })

vim.opt.cursorline = true
vim.opt.conceallevel = 2
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })
