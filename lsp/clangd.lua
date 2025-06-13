return {
	cmd = { "clangd", "--clang-tidy", "--background-index", "--cross-file-rename"},
	root_markers = { ".clangd", "compile_commands.json" },
}
