-- some miscs key maps

---@diagnostic disable-next-line: undefined-global
local vim = vim
local map = vim.api.nvim_set_keymap
local opts =  { noremap = true, silent = true}

map('n', '<C-P>', ':bp<CR>', { noremap = true, silent = true })
map('n', '<C-N>', ':bn<CR>', { noremap = true, silent = true })

map('i', 'jk', '<ESC>', { noremap = true, silent = true})

map('n', '<M-h>', '^', opts)
map('v', '<M-h>', '^', opts)

map('n', '<M-l>', '$', opts)
map('v', '<M-l>', '$', opts)

map('n', '<ESC>', ":nohlsearch<CR>", opts)

vim.g.SpellCheckToggle = function ()
  vim.o.spell = not vim.o.spell
  if vim.o.spell == true then
    print("Spelling check enable")
  else
    print("Spelling check disable")
  end
end

map('n', '<leader>cs', '<cmd>call g:SpellCheckToggle()<CR>', { noremap = true })
