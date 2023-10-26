local perfanno = require("perfanno")
local util = require("perfanno.util")

local bgcolor = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "gui")

perfanno.setup({
	-- Creates a 10-step RGB color gradient beween bgcolor and "#CC3300"
	line_highlights = util.make_bg_highlights(bgcolor, "#CC3300", 10),
	vt_highlight = util.make_fg_highlight("#CC3300"),
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- TODO:move the follow mpas to which-key
keymap("n", "<leader>pplf", ":PerfLoadFlat<CR>", opts)
keymap("n", "<leader>pplg", ":PerfLoadCallGraph<CR>", opts)
keymap("n", "<leader>pplo", ":PerfLoadFlameGraph<CR>", opts)

keymap("n", "<leader>ppe", ":PerfPickEvent<CR>", opts)

keymap("n", "<leader>ppa", ":PerfAnnotate<CR>", opts)
keymap("n", "<leader>ppf", ":PerfAnnotateFunction<CR>", opts)
keymap("v", "<leader>ppa", ":PerfAnnotateSelection<CR>", opts)

keymap("n", "<leader>ppt", ":PerfToggleAnnotations<CR>", opts)

keymap("n", "<leader>pph", ":PerfHottestLines<CR>", opts)
keymap("n", "<leader>pps", ":PerfHottestSymbols<CR>", opts)
keymap("n", "<leader>ppc", ":PerfHottestCallersFunction<CR>", opts)
keymap("v", "<leader>ppc", ":PerfHottestCallersSelection<CR>", opts)
