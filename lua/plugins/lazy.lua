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
		lazy = false,
	},

	-- Profiler
	{
		"t-troebst/perfanno.nvim",
		config = function()
			require("plugins/perfanno-nvim")
		end,
		dependencies = { "navarasu/onedark.nvim" },
	},

	{
		"hiphish/rainbow-delimiters.nvim",
		config = function()
			require("plugins/rainbow-delimiters-nvim")
		end,
		dependencies = { "navarasu/onedark.nvim" },
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

	-- TODO: use none-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			-- require("plugins/null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- lsp client
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
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-refactor",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("plugins/nvim-treesitter")
		end,
	},
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		config = function()
			require("plugins/orgmode")
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
		dependencies = { "nvim-lua/plenary.nvim" },
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
		dependencies = { "hiphish/rainbow-delimiters.nvim" },
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
		cmd = "Trouble",
		opts = require("plugins/nvim-trouble"),
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins/gitsigns-nvim")
		end,
	},
	{
		"nvim-lua/lsp-status.nvim",
		enabled = true,
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
		"Maan2003/lsp_lines.nvim",
		config = function()
			-- require("plugins/lsp-lines-nvim")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins/mason")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("plugins/nvim-bqf")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function() end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		ft = { "scala", "sbt", "java" },
		opts = require("plugins/nvim-metals").opts,
		config = require("plugins/nvim-metals").config,
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("plugins/noice")
		end,
		enabled = true,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{ "folke/zen-mode.nvim" },
	{ "folke/twilight.nvim" },
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins/conform")
		end,
	},
	{ "sindrets/diffview.nvim" },
	{
		"folke/which-key.nvim",
		config = function()
			require("plugins/which-key")
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = require("plugins/avante"),
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
})
