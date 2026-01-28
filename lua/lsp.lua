-- global lsp configs
-- should load after cmp_nvim_lsp

local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

caps = {
	textDocument = {
		semanticTokens = {
			multilineTokenSupport = true,
		},
	},
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

	buf_set_keymap("n", "<leader>gg", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	buf_set_keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	buf_set_keymap("n", "gq", "<cmd>Trouble quickfix<CR>", opts)
	buf_set_keymap("n", "gl", "<cmd>Trouble loclist<CR>", opts)

	local use_saga = true

	if use_saga == true then
		buf_set_keymap("n", "gr", "<cmd>Lspsaga finder tyd+ref+imp+def<CR>", opts)
		buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
		buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
		buf_set_keymap("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)

		buf_set_keymap("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
		buf_set_keymap("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

		buf_set_keymap("n", "go", "<cmd>Lspsaga outline<cr>", opts)
	end
end

local server_names = {
	"lua_ls",
	"clangd",
	"pyright",
	"bashls",
	"rust_analyzer",
}

vim.lsp.config("*", {
	capabilities = caps,
	root_markers = { ".git" },
})

vim.lsp.config("clangd", {
	filetypes = { "c", "cpp", "h" },
	on_attach = on_attach
})

vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
	on_attach = on_attach
})

vim.lsp.config("rust_analyzer", {
	filetypes = { "rust" },
	on_attach = on_attach,
})


vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
