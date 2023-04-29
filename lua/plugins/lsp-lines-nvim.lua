-- Disable virtual_text since it's redundant due to lsp_lines.
--
require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false,
})
