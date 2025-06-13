local opts = {
	restore = true,
	follow = false,
  auto_refresh = false, -- auto refresh when open
	modes = {
		lsp_base = {
			params = {
				include_current = false,
			},
		},
	},
}

return opts
