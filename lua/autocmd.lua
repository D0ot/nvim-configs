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
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = { "*" },
	callback = hi_func,
	group = higrp,
})

local qfgrp = vim.api.nvim_create_augroup("QuickFixTweak", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.bo.buflisted = false
	end,
	group = qfgrp,
})
