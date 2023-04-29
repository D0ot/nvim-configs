---@diagnostic disable-next-line: undefined-global
local vim = vim
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
g.FcitxSaveInput = function()
	local input_status = tonumber(fn.system("fcitx5-remote"))
	g.fcitx_last_input_status = input_status
	if input_status == 2 then
		fn.system("fcitx5-remote -c")
	end
end

g.FcitxRestoreInput = function()
	if g.fcitx_last_input_status == 2 then
		fn.system("fcitx5-remote -o")
	end
end

cmd("autocmd InsertLeave * call FcitxSaveInput()")
cmd("autocmd VimEnter * call FcitxSaveInput()")
cmd("autocmd InsertEnter * call FcitxRestoreInput()")

-- auto lint
-- cmd([[
-- au BufEnter * lua require('lint').try_lint()
-- au BufWritePost * lua require('lint').try_lint()
-- ]])

-- fix quickfix size
-- local qfgrp = vim.api.nvim_create_augroup("QuickfixGroup", { clear = true })
-- vim.api.nvim_create_autocmd("BufAdd FileType qf", {
-- command = "vim.notify('buftype quickfix')",
-- group = qfgrp,
-- })
--

-- for Tree-sitter-Context
local hi_func = function()
	vim.cmd("hi TreesitterContextLineNumber gui=italic,bold guifg=White")
	vim.cmd("hi TreesitterContext gui=italic,bold guisp=Grey")
	vim.cmd("hi TreesitterContextBottom gui=italic,bold,underdotted guisp=Grey")
end

local higrp = vim.api.nvim_create_augroup("HighLightGroup", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme *", {
	callback = hi_func,
	group = higrp,
})

-- for Tree-sitter rainbow
-- TODO: this is just a workaround, a fix in ts-rainbow plugin needed
-- issuse: https://github.com/p00f/nvim-ts-rainbow/issues/112

local valid_rainbow = function()
	vim.cmd("TSBufToggle rainbow")
	vim.cmd("TSBufToggle rainbow")
end
local rainbow_grp = vim.api.nvim_create_augroup("TSRainbow", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave *", {
	callback = valid_rainbow,
	group = rainbow_grp,
})
