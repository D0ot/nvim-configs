---@diagnostic disable-next-line: undefined-global
local vim = vim
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

local highlight = {
	"IndentBlanklineIndent1",
	"IndentBlanklineIndent2",
	"IndentBlanklineIndent3",
	"IndentBlanklineIndent4",
	"IndentBlanklineIndent5",
	"IndentBlanklineIndent6",
}

local all_grey = {
	"IndentBlanklineIndent4", -- grey
}

local hooks = require("ibl.hooks")

local config = {
	enabled = true,
	indent = {
		char = "│",
		tab_char = "│",
		highlight = all_grey,
	},

	whitespace = { highlight = { "Whitespace", "NonText" } },
	exclude = {
		buftypes = { "terminal" },
		filetypes = { "NvimTree", "dashboard", "lspsagafinder" },
	},

	--- TODO: underline style
	scope = {
		enabled = true,
		highlight = highlight,
		char = "┃",
		show_start = false,
		show_end = false,
	},
}

local blankline = require("ibl").setup(config)

-- TODO: got performance issue after enable this
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

return blankline
