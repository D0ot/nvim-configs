require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup({
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
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})
