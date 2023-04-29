vim.g.plugin_manager = "lazy"

require("lazy").setup({
	-- vim plugin, not config needed
	{ "dstein64/vim-startuptime" },

	-- Color scheme
	{
		"navarasu/onedark.nvim",
		config = function()
			require("plugins/onedark")
		end,
	},

	{
		"rcarriga/nvim-notify",
		config = function()
			require("plugins/nvim-notify")
		end,
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons" },

	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins/nvim-tree")
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins/null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- lsp client
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins/nvim-lspconfig")
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins/nvim-autopairs")
		end,
	},
	-- autocomplete
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins/nvim-cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind-nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			require("plugins/nvim-treesitter")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("plugins/lspsaga")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("plugins/nvim-treesitter-textobjects")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("plugins/nvim-treesitter-context")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins/telescope")
		end,
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins/lualine")
		end,
	},
	{
		"abecodes/tabout.nvim",
		config = function()
			-- require("plugins/tabout")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins/indent-blankline")
		end,
	},
	{
		"romgrk/barbar.nvim",
		config = function()
			require("plugins/barbar")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins/toggleterm")
		end,
	},
	-- use("ray-x/lsp_signature.nvim")

	{
		"lewis6991/spellsitter.nvim",
		config = function()
			require("plugins/spellsitter")
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("plugins/nvim-scrollbar")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins/nvim-colorizer")
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			require("plugins/undotree")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins/todo-comments")
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins/nvim-trouble")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns-nvim")
		end,
	},
	{
		"nvim-lua/lsp-status.nvim",
		config = function()
			require("plugins/lsp-status-nvim")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins/comment")
		end,
	},
	{
		"mattn/emmet-vim",
		config = function()
			require("plugins/emmet-vim")
		end,
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("plugins/dashboard")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"leafOfTree/vim-vue-plugin",
		config = function()
			require("plugins/vim-vue-plugin")
		end,
	},
	{
		"gpanders/editorconfig.nvim",
		config = function()
			require("plugins/editorconfig-nvim")
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			-- require("plugins/lsp-lines-nvim")
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("plugins/leap")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins/mason")
		end,
	}, -- NOTE: make sure the which-key is the last one
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins/which-key")
		end,
	},
})