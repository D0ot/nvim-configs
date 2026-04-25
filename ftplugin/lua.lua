local bo = vim.bo
local cmd = vim.cmd

bo.expandtab = false
bo.shiftwidth = 2
bo.tabstop = 2
bo.softtabstop = 2

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
		vim.treesitter.start()
	end,
})
