local notify_opts = {
  stages = "fade",
  timeout = 2000,
  background_colour = "#000000"
}

if vim.g.background_transparency then
  notify_opts.background_colour = "#ffffff"
end

vim.notify = require("notify")
vim.notify.setup(notify_opts)
