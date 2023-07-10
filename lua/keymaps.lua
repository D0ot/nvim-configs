-- some miscs key maps

---@diagnostic disable-next-line: undefined-global
local vim = vim
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-P>", ":bp<CR>", { noremap = true, silent = true })
map("n", "<C-N>", ":bn<CR>", { noremap = true, silent = true })

map("i", "jk", "<ESC>", { noremap = true, silent = true })

map("n", "<M-h>", "^", opts)
map("v", "<M-h>", "^", opts)

map("n", "<M-l>", "$", opts)
map("v", "<M-l>", "$", opts)

map("n", "<ESC>", ":nohlsearch<CR>", opts)

vim.g.SpellCheckToggle = function()
	vim.o.spell = not vim.o.spell
	if vim.o.spell == true then
		print("Spelling check enable")
	else
		print("Spelling check disable")
	end
end

map("n", "<leader>cs", "<cmd>call g:SpellCheckToggle()<CR>", { noremap = true })

vim.g.ToggleQuickFix = function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end

map("n", "<M-q>", "<cmd>call ToggleQuickFix()<cr>", { silent = true, noremap = true })
