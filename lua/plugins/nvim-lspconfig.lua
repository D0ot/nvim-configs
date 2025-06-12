---@diagnostic disable-next-line: undefined-global
local vim = vim
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local mason_lspconfig = require("mason-lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

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
	"cmake",
	"tsserver",
	"vuels",
	"cssls",
	"texlab",
	"pyright",
	"bashls",
	"rust_analyzer",
}

mason_lspconfig.setup({
	ensure_installed = server_names,
})

-- TODO: add a default empty file as lsp server config
for _, server_name in pairs(server_names) do
	local config_file = "lsp/" .. server_name
	local full_path = vim.fn.expand(vim.g.config_home .. "/lua/" .. config_file)
	local opts = {}
	if vim.fn.filereadable(full_path .. ".lua") ~= 0 then
		opts = require(config_file)
	end

	opts.on_attach = on_attach
	opts.flags = {
		debounce_text_changes = 150,
	}
	opts.capabilities = capabilities
	lspconfig[server_name].setup(opts)
end
