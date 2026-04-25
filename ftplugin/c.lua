local bo = vim.bo
local cmd = vim.cmd

bo.expandtab = false
bo.shiftwidth = 8
bo.tabstop = 8
bo.softtabstop = 8

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'

-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
