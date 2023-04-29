local bo = vim.bo
local cmd = vim.cmd

local function buf_set_keymap(...)
	vim.api.nvim_buf_set_keymap(bufnr, ...)
end
