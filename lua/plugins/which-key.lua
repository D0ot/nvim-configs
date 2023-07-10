-- nothing there, the key bind is defined in others files!
local wk = require("which-key")

wk.setup({

	plugins = {
		presets = {
			operator = true,
			motions = true,
		},
	},
	operators = { ["<space>cC"] = "Comments" },
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
		p = {},
	},
})

local comment_api = require("Comment.api")

wk.register({
	b = {
		name = "BufferLine",
		d = { "<cmd>BufferClose<cr>", "Close Current Buffer" },
		o = { "<cmd>BufferOrderByBufferNumber<cr>", "Order Buffer By Number" },
		c = { "<cmd>BufferCloseAllButCurrent<cr>", "Close All Buffers But Keep Current" },
		p = { "<cmd>BufferPick<cr>", "Pick A Buffer" },
	},
}, {
	prefix = "<leader>",
})

-- TODO: make multiline comments work
wk.register({
	c = {
		name = "Comment",
		c = { '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>', "Comment linewise" },
		b = { '<cmd>lua require("Comment.api").toggle.blockwise.current()<cr>', "Comment blockwise" },

		-- TODO, to make the multi-line wise comment work
		C = {
			function()
				local api = require("Comment.api")
				api.call("toggle.linewise", "g@")
			end,
			"Comment linewise ex",
		},

		B = { '<cmd>lua require("Comment.api").call("toggle.blockwise")<cr>g@', "Comment blockwise ex" },

		o = {
			function()
				comment_api.insert_linewise_below({})
			end,
			"Insert a line comment below",
		},

		O = {
			function()
				comment_api.insert_linewise_above({})
			end,
			"Insert a line comment above",
		},
	},
}, {
	prefix = "<leader>",
})

wk.register({
	f = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		F = { "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<cr>", "Find Files EX" },
		r = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
		b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
		t = { "<cmd>Telescope treesitter<cr>", "Find By Treesitter" },
		k = { "<cmd>Telescope keymaps<cr>", "Find in keymaps" },
		n = { "<cmd>Telescope notify<cr>", "Find in notify history" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find in lsp document symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find in lsp workspace symbols" },
		h = { "<cmd>Telescope help_tags<cr>", "Find in neovim help tags" },
		c = { "<cmd>TodoTelescope<cr>", "Find in TODO" },
		m = { "<cmd>Format<cr>", "Code format" },
		p = { "<cmd>Telescope planets<cr>", "Find in planets" },
		g = {
			s = { "<cmd>Telescope git_status<cr>", "Find in git status" },
			c = { "<cmd>Telescope git_commits<cr>", "Find in git commits" },
			h = { "<cmd>Telescope git_stash<cr>", "Find in git stash" },
		},
	},
}, {
	prefix = "<leader>",
})

wk.register({
	["<space>"] = { "<cmd>Telescope keymaps<cr>", "Find in keymaps" },
}, {
	prefix = "<leader>",
})

wk.register({
	n = {
		name = "NVim and Mics",
		c = { "<cmd>cd ~/.config/nvim/<cr>", "Nvim configs" },
		g = {
			function()
				Toggleterm_cmds.lazyconfig()
			end,
			"open lazygit with config root-dir and work-tree",
		},
	},
}, {
	prefix = "<leader>",
})

if vim.g.plugin_manager == "packer" then
	wk.register({
		p = {
			name = "Packer",
			s = { "<cmd>PackerSync<cr>", "Packer Sync" },
			r = { '<cmd>:lua require("utils").packer_reload()<cr>', "Packer Reset" },
			c = { "<cmd>PackerCompile<cr>", "Packer Compile" },
		},
	}, {
		prefix = "<leader>",
	})
end

if vim.g.plugin_manager == "lazy" then
	wk.register({
		p = {
			name = "Lazy",
			s = {
				function()
					require("lazy").sync()
				end,
				"Lazy Sync",
			},
		},
	}, {
		prefix = "<leader>",
	})
end

wk.register({
	t = {
		name = "NVimTree, ToggleTerm, and Toggles",
		t = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
		f = { "<cmd>NvimTreeFocus<cr>", "Focus Tree" },
		p = { "<cmd>NvimTreeClipboard<cr>", "Print clipboard content" },
		r = { "<cmd>NvimTreeRefresh<cr>", "Refresh the tree" },
		g = {
			function()
				Toggleterm_cmds.lazygit()
			end,
			"Toggle lazygit",
		},
		d = {
			function()
				Toggleterm_cmds.lazydocker()
			end,
			"Toggle lazydocker",
		},
		o = { "<cmd>LSoutlineToggle<cr>", "Lspsaga LSP outline" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	u = {
		name = "UndoTree",
		t = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree" },
		f = { "<cmd>UndotreeFocus<cr>", "Focus Undotree" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	x = {
		name = "Trouble",
		x = { "<cmd>Trouble<cr>", "Trouble Default Mode" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble document" },
		q = { "<cmd>Trouble quickfix<cr>", "Trouble quickfix" },
		l = { "<cmd>Trouble loclist<cr>", "Trouble loclist" },
		r = { "<cmd>Trouble lsp_references<cr>", "Trouble LSP referenes" },
	},
}, {
	prefix = "<leader>",
})

wk.register({
	s = { "<plug>(leap-forward-to)", "Leap forward, inclusive" },
	S = { "<plug>(leap-backward-to)", "Leap backward, inclusive" },
}, {
	mode = { "n", "x", "o" },
})

wk.register({
	x = { "<plug>(leap-forward-till)", "Leap forward till, exclusive" },
	X = { "<plug>(leap-backward-till)", "Leap backward till, exclusive" },
}, {
	mode = { "o", "x" },
})

local gs = require("gitsigns")
wk.register({
	g = {
		d = { gs.diffthis, "Gitsigns diff this" },
		n = { gs.next_hunk, "Gitsigns next hunk" },
		p = { gs.prev_hunk, "Gitsigns prev hunk" },
		r = { gs.reset_hunk, "Gitsigns reset hunk" },
		s = { gs.stage_hunk, "Gitsigns stage hunk" },
		u = { gs.undo_stage_hunk, "Gitsigns undo stage hunk" },
		v = { gs.preview_hunk, "Gitsigns preview hunk" },
		t = {
			name = "Gitsigns toggle",
			d = { gs.toggle_deleted, "Gitsigns toggle deleted" },
			b = { gs.toggle_current_line_blame, "Gitsigns toggle blame" },
		},
	},
}, {
	mode = { "n" },
	prefix = "<leader>",
})

wk.register({
	q = {
		o = { "<cmd>copen<cr>", "open QuickFix" },
		p = { "<cmd>cpreviou<cr>", "open prev item in QuickFix" },
		n = { "<cmd>cnext<cr>", "Open Next item in QuickFix" },
	},
}, {
	mode = { "n" },
	prefix = "<leader>",
})

wk.register({
	r = {
		r = { "<cmd>edit!<cr>", "Discard the edit, and reload the file" },
	},
	{
		mode = { "n" },
		prefix = "<leader>",
	},
})
