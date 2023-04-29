local lualine = require("lualine")
local lsp_status = require("lsp-status")

local not_focus = function()
	return "NO-FOCUS"
end

local lsp_status_info = function()
	return lsp_status.status()
end

-- TODO: currently it is too coarse
return lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "toggleterm" },
			winbar = { "toggleterm" },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { { lsp_status_info, color = { fg = "#61afef" } }, "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { { not_focus, color = { fg = "#d6ccc2" } } },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree" },
})
