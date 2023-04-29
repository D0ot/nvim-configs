---@diagnostic disable-next-line: undefined-global
local vim = vim

local packer = require('packer')


local M = {
  packer_reload = function ()
    packer.reset()
    package.loaded['plugins/packer'] = nil
    vim.api.nvim_command('source $MYVIMRC')
  end
}

return M
