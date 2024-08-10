---@diagnostic disable-next-line: undefined-global
local v = vim
local g = v.g
local opt = v.opt

-- global variable
g.config_home = "$HOME/.config/nvim"

-- General setup
g.mapleader = " "

g.tex_flavor = "latex"

opt.encoding = "utf-8"
opt.lazyredraw = false
opt.cursorline = true
opt.guicursor = ""
opt.smartcase = true
opt.autoread = true
opt.number = true
opt.signcolumn = "yes"
opt.hidden = true
opt.syntax = "enable"
opt.scrolloff = 10
opt.list = true
opt.spell = false
opt.spelllang = "en_us,cjk"
opt.termguicolors = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.clipboard = "unnamedplus"
opt.filetype = "plugin"

opt.colorcolumn = "80"
opt.title = true
