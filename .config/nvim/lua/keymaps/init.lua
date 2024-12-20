remap = vim.keymap.set
vim.g.mapleader = " "

require("keymaps.indent")
require("keymaps.plugins")

function _G.check_prev_char()
   local line = vim.api.nvim_get_current_line()
   local col = vim.api.nvim_win_get_cursor(0)[2] + 1
   if col > 1 and line:sub(col - 1, col - 1) == "j" then
      -- Use nvim_replace_termcodes to interpret "<BS><Esc>" correctly
      return vim.api.nvim_replace_termcodes("<BS><C-\\><C-n>", true, true, true)
   else
      return "k"
   end
end

vim.api.nvim_set_keymap("i", "k", "v:lua.check_prev_char()", { expr = true, noremap = true })

remap("t", "<Tab>", "<C-\\><C-n>", { noremap = true, silent = true })

remap("n", "<leader>bn", "<cmd>bn<CR>", { noremap = true, silent = true })
remap("n", "<leader>bp", "<cmd>bp<CR>", { noremap = true, silent = true })
