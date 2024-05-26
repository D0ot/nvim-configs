local vim = vim
vim.g.bufferline = {
	animation = false,
	auto_hide = false,
	add_in_buffer_number_order = true,
	exclude_ft = { "qf" },
}

-- key bindings definitions
--
local map = vim.api.nvim_set_keymap

map("i", "<M-1>", "<cmd>BufferGoto 1<cr>", { silent = true, noremap = true })
map("i", "<M-2>", "<cmd>BufferGoto 2<cr>", { silent = true, noremap = true })
map("i", "<M-3>", "<cmd>BufferGoto 3<cr>", { silent = true, noremap = true })
map("i", "<M-4>", "<cmd>BufferGoto 4<cr>", { silent = true, noremap = true })
map("i", "<M-5>", "<cmd>BufferGoto 5<cr>", { silent = true, noremap = true })
map("i", "<M-6>", "<cmd>BufferGoto 6<cr>", { silent = true, noremap = true })
map("i", "<M-7>", "<cmd>BufferGoto 7<cr>", { silent = true, noremap = true })
map("i", "<M-8>", "<cmd>BufferGoto 8<cr>", { silent = true, noremap = true })

map("n", "<M-1>", "<cmd>BufferGoto 1<cr>", { silent = true, noremap = true })
map("n", "<M-2>", "<cmd>BufferGoto 2<cr>", { silent = true, noremap = true })
map("n", "<M-3>", "<cmd>BufferGoto 3<cr>", { silent = true, noremap = true })
map("n", "<M-4>", "<cmd>BufferGoto 4<cr>", { silent = true, noremap = true })
map("n", "<M-5>", "<cmd>BufferGoto 5<cr>", { silent = true, noremap = true })
map("n", "<M-6>", "<cmd>BufferGoto 6<cr>", { silent = true, noremap = true })
map("n", "<M-7>", "<cmd>BufferGoto 7<cr>", { silent = true, noremap = true })
map("n", "<M-8>", "<cmd>BufferGoto 8<cr>", { silent = true, noremap = true })

map("t", "<M-1>", "<cmd>BufferGoto 1<cr>", { silent = true, noremap = true })
map("t", "<M-2>", "<cmd>BufferGoto 2<cr>", { silent = true, noremap = true })
map("t", "<M-3>", "<cmd>BufferGoto 3<cr>", { silent = true, noremap = true })
map("t", "<M-4>", "<cmd>BufferGoto 4<cr>", { silent = true, noremap = true })
map("t", "<M-5>", "<cmd>BufferGoto 5<cr>", { silent = true, noremap = true })
map("t", "<M-6>", "<cmd>BufferGoto 6<cr>", { silent = true, noremap = true })
map("t", "<M-7>", "<cmd>BufferGoto 7<cr>", { silent = true, noremap = true })
map("t", "<M-8>", "<cmd>BufferGoto 8<cr>", { silent = true, noremap = true })
