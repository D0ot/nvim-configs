local bo = vim.bo
local cmd = vim.cmd

bo.expandtab = true
bo.shiftwidth = 4
bo.tabstop = 4
bo.softtabstop = 4

-- plugins configurations
local cmp = require("cmp")
cmp.setup.filetype("sh", {
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
		keyword_length = 2,
	},
})
