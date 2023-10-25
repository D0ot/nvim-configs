require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
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
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},

	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "<leader>ss",
			node_incremental = "<leader>sn",
			scope_incremental = "<leader>si",
			node_decremental = "<leader>sN",
		},
	},

	rainbow = {
		enable = true,
		extended_mode = true,
	},

	context_commentstring = {
		enable = true,
	},
})
