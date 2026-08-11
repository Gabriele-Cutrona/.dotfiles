-- Froms spaces to tabs: <Leader>i<number>, <Leader>it, <Leader>ir
-- Froms tabs to spaces: <Leader>i<number>, <Leader>is, <Leader>ir

local function get_string(width)
	return "<cmd>set tabstop=" .. width .. "| set shiftwidth=" .. width .. "| set softtabstop=" .. width .. "<CR>"
end

Remap("n", "<Leader>i2", get_string(2), { noremap = true, silent = true })
Remap("n", "<Leader>i3", get_string(3), { noremap = true, silent = true })
Remap("n", "<Leader>i4", get_string(4), { noremap = true, silent = true })
Remap("n", "<Leader>i8", get_string(8), { noremap = true, silent = true })

Remap("n", "<Leader>is", "<cmd>lua vim.opt.expandtab=true<CR>", { noremap = true, silent = true })
Remap("n", "<Leader>it", "<cmd>lua vim.opt.expandtab=false<CR>", { noremap = true, silent = true })

Remap("n", "<Leader>ir", "<cmd>%retab!<CR>", { noremap = true, silent = true })
