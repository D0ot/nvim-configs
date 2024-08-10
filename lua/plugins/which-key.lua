-- nothing there, the key bind is defined in others files!
local wk = require("which-key")

wk.setup({

	plugins = {
		presets = {
			operator = true,
			motions = true,
		},
	},
})

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bd", "<cmd>BufferClose<cr>", desc = "Close Current Buffer" },
	{ "<leader>bo", "<cmd>BufferOrderByBufferNumber<cr>", desc = "Order Buffers By Number" },
	{ "<leader>bp", "<cmd>BufferPick<cr>", desc = "Pick A Buffer" },
	{ "<leader>bc", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close All Buffers But Current One" },
})

wk.add({
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{
		"<leader>fF",
		"<cmd>Telescope find_files find_command=rg,--no-ignore,--hiden,--files<cr>",
		desc = "Find Files EX",
	},
	{ "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Recent Files" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find in Buffers" },
	{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Find Treesitter" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find in Keymaps" },
	{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Find in Notify History" },
	{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Find in LSP Document Symbols" },
	{ "<leader>fS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Find in Workspace Symbols" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find in Help Tags" },
	{ "<leader>fc", "<cmd>TodoTelescope<cr>", desc = "Find in TODO" },
	{ "<leader>fm", "<cmd>Format <cr>", desc = "Format" },
	{ "<leader>fp", "<cmd>Telescope planets<cr>", desc = "Find Planets" },
	{ "<leader>fg", group = "Find Git" },
	{ "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Find in Git status" },
	{ "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Find in Git commits" },
	{ "<leader>fgh", "<cmd>Telescope git_stash<cr>", desc = "Find in Git stash" },
})

wk.add({
	{ "<leader>n", group = "NVim and Misc" },
	{ "<leader>nc", "<cmd>cd ~/.config/nvim<cr>", desc = "Nvim configs" },
	{
		"<leader>ng",
		function()
			Toggleterm_cmds.lazyconfig()
		end,
		desc = "Open lazygit with config root-dir and work-tree",
	},
})

if vim.g.plugin_manager == "packer" then
	wk.add({
		{ "<leader>p", group = "Package Manager" },
		{ "<leader>ps", "<cmd>PackerSync<cr>", desc = "Packer Sync" },
		{
			"<leader>pr",
			function()
				require("utils").packer_reload()
			end,
			desc = "Packer Reset",
		},
		{ "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Packer Compile" },
	})
end

if vim.g.plugin_manager == "lazy" then
	wk.add({
		{ "<leader>p", group = "Package Manager" },
		{
			"<leader>ps",
			function()
				require("lazy").sync()
			end,
			desc = "Packer Sync",
		},
	})
end

wk.add({
	{ "<leader>t", group = "NVimTree, Terminal, Toggles" },
	{ "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Tree" },
	{ "<leader>tf", "<cmd>NvimTreeFocus<cr>", desc = "Focus File Tree" },
	{ "<leader>tp", "<cmd>NvimTreeToggle<cr>", desc = "Print Clipboard of NVimTree" },
	{ "<leader>tr", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh File Tree" },
	{
		"<leader>tg",
		function()
			Toggleterm_cmds.lazygit()
		end,
		desc = "Toggle Lazygit",
	},
	{
		"<leader>td",
		function()
			Toggleterm_cmds.lazydocker()
		end,
		desc = "Toggle Lazydocker",
	},
	{ "<leader>to", "<cmd>Lspsaga outline", desc = "Toggle Lspsaga Outline" },
	{ "<leader>tz", "<cmd>ZenMode<cr>", desc = "Enable Zen Mode and Trilight" },
})

wk.add({
	{ "<leader>u", group = "UndoTree" },
	{ "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Toggle UndoTree" },
	{ "<leader>uf", "<cmd>UndotreeFocus<cr>", desc = "Focus UndoTree" },
})

wk.add({
	{ "<leader>x", group = "Trouble" },
	{ "<leader>xx", "<cmd> Trouble <cr>", desc = "Trouble Default Mode" },
	{ "<leader>xw", "<cmd> Trouble workspace_diagnostics<cr>", desc = "Trouble" },
	{ "<leader>xd", "<cmd> Trouble document_diagnostics<cr>", desc = "Trouble" },
	{ "<leader>xq", "<cmd> Trouble quickfix<cr>", desc = "Trouble" },
	{ "<leader>xl", "<cmd> Trouble loclist<cr>", desc = "Trouble" },
	{ "<leader>xr", "<cmd> Trouble lsp_referencescr>", desc = "Trouble" },
})

local gs = require("gitsigns")
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>gd", gs.diffthis, desc = "Gitsigns diff this" },
	{ "<leader>gn", gs.next_hunk, desc = "Gitsigns Next Hunk" },
	{ "<leader>gp", gs.prev_hunk, desc = "Gitsigns Prev Hunk" },
	{ "<leader>gr", gs.reset_hunk, desc = "Gitsigns Reset Hunk" },
	{ "<leader>gs", gs.stage_hunk, desc = "Gitsigns Stage Hunk" },
	{ "<leader>gu", gs.undo_stage_hunk, desc = "Gitsigns Undo Stage Hunk" },
	{ "<leader>gv", gs.preview_hunk, desc = "Gitsigns Preview Hunk" },
	{ "<leader>gt", group = "Gitsigns Toggles" },
	{ "<leader>gtd", gs.toggle_deleted, desc = "Gitsigns Toggle Deleted" },
	{ "<leader>gtb", gs.toggle_current_line_blame, desc = "Gitsigns Toggle Blame" },
})

wk.add({
	{ "<leader>q", group = "QuickFix" },
	{ "<leader>qo", "<cmd>copen<cr>", desc = "Open QuickFix" },
	{ "<leader>qp", "<cmd>cpreviou<cr>", desc = "Next Item in QuickFix" },
	{ "<leader>qn", "<cmd>cnext<cr>", desc = "Prev Item in QuickFix" },
})

wk.add({
	{ "<leader>r", group = "Reload" },
	{ "<leader>rr", "<cmd>edit!<cr>", desc = "Reload Current Buffer, Discard Unsaved Changes" },
})
