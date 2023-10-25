local tabout = require("tabout")

local ret = tabout.setup({
	tabkey = "",
	backwards_tabkey = "",
	act_as_tab = false,
	act_as_shift_tab = false,
})

-- key bindings definitions

vim.api.nvim_set_keymap("i", "<M-0>", "<Plug>(TaboutMulti)", { silent = true })
vim.api.nvim_set_keymap("i", "<M-9>", "<Plug>(TaboutBackMulti)", { silent = true })

return ret
