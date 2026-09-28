-- Froms spaces to tabs: <Leader>i<number>, <Leader>it, <Leader>ir
-- Froms tabs to spaces: <Leader>i<number>, <Leader>is, <Leader>ir

local function get_string(width)
	return "<cmd>set tabstop=" .. width .. "| set shiftwidth=" .. width .. "| set softtabstop=" .. width .. "<CR>"
end

Remap("n", "<Leader>i2", get_string(2), Opts)
Remap("n", "<Leader>i3", get_string(3), Opts)
Remap("n", "<Leader>i4", get_string(4), Opts)
Remap("n", "<Leader>i8", get_string(8), Opts)

Remap("n", "<Leader>is", "<cmd>lua vim.opt.expandtab=true<CR>", Opts)
Remap("n", "<Leader>it", "<cmd>lua vim.opt.expandtab=false<CR>", Opts)

Remap("n", "<Leader>ir", "<cmd>%retab!<CR>", Opts)
