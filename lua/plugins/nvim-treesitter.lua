vim.g.cursorhold_updatetime = 100

require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = false,

	ensure_installed = {
		"c",
		"cpp",
		"javascript",
		"rust",
		"typescript",
		"css",
		"html",
		"vue",
		"lua",
		"markdown",
		"markdown_inline",
		"org",
		"luadoc",
		"vimdoc",
		"regex",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	refactor = {
		navigation = {
			enable = true,
			keymaps = {
				goto_next_usage = "<a-j>",
				goto_previous_usage = "<a-k>",
			},
		},
		highlight_current_scope = { enable = false },
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
		},
	},
})
