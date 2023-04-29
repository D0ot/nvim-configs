local vim = vim

local map = vim.api.nvim_set_keymap

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  count = 10,
  cmd = 'lazygit',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
})

local function lazygit_toggle()
  lazygit:toggle()
end


local lazydocker = Terminal:new({
  count = 15,
  cmd = 'lazydocker',
  direction = 'float',
  float_opts = {
    border = 'double',
  }
})

local function lazydocker_toggle()
  lazydocker:toggle()
end

local lazyconfig = Terminal:new({
  count = 15,
  cmd = 'lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME',
  direction = 'float',
  float_opts = {
    border = 'double',
  }
})

local function lazyconfig_toggle()
  lazyconfig:toggle()
end

Toggleterm_cmds = {
  lazygit = lazygit_toggle,
  lazydocker= lazydocker_toggle,
  lazyconfig = lazyconfig_toggle
}

local ret = require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 15,
  open_mapping = '<M-t>',
  -- direction = 'float',
  hide_numbers = true,
  close_on_exit = true,
  shade_terminals = true
}

return ret
