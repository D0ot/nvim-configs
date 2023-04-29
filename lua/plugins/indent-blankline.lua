---@diagnostic disable-next-line: undefined-global
local vim = vim
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.g.indent_blankline_char = "│"
local blankline = require('indent_blankline').setup {
  space_char_blankline = ' ',
  buftype_exclude = {'terminal'},
  filetype_exclude = {'NvimTree', 'dashboard', 'lspsagafinder'},
  show_current_context = true,
  context_highlight_list = {'IndentBlankLineContext'},
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
}

return blankline;
