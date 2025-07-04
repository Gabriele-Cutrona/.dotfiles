vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.fillchars = { eob = " " }

vim.o.timeoutlen = 100

vim.cmd("set clipboard+=unnamedplus")

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
vim.o.pumblend = 0 -- Disable blend for popup menus
vim.o.winblend = 0 -- Disable blend for floating windows
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = 'none' })

vim.opt.cursorline = true
vim.opt.conceallevel = 2
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#cba6f7', bold = true })  -- Line number styling
