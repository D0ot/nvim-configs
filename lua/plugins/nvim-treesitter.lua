vim.g.cursorhold_updatetime = 100

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local ensure_installed = {
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
	"luadoc",
	"vimdoc",
	"regex",
}

require("nvim-treesitter").install(ensure_installed)


