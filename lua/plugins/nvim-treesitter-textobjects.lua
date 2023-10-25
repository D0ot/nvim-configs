require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = { query = "@function.outer", desc = "Select outer part of function" },
				["if"] = { query = "@function.inner", desc = "Select inner part of function" },

				["ac"] = { query = "@class.outer", desc = "Select inner part of class region" },
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

				["ab"] = { query = "@block.outer", desc = "Select outer part of block" },
				["ib"] = { query = "@block.inner", desc = "Select inner part of block" },

				["ak"] = { query = "@call.outer", desc = "Select outer part of call" },
				["ik"] = { query = "@call.inner", desc = "Select inner part of call" },

				["al"] = { query = "@loop.outer", desc = "Select outer part of loop" },
				["il"] = { query = "@loop.inner", desc = "Select inner part of loop" },

				["am"] = { query = "@comment.outer", desc = "Select outer part of comment" },

				["ad"] = { query = "@conditional.outer", desc = "Select outer part of conditional" },
				["id"] = { query = "@conditional.inner", desc = "Select inner part of conditional" },

				["ap"] = { query = "@parameter.outer", desc = "Select outer part of parameter" },
				["ip"] = { query = "@parameter.inner", desc = "Select inner part of parameter" },

				["as"] = { query = "@statement.outer", desc = "Select outer part of statement" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = false,
		},

		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		-- INFO: seems not good for use
		-- can use some key map to implement same function
		lsp_interop = {
			enable = false,
			border = "none",
			peek_definition_code = {
				["<leader>df"] = "@function.outer",
				["<leader>dF"] = "@class.outer",
			},
		},

		-- TODO: enable this function with personal configuration
		move = {
			enable = false,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = { query = "@class.outer", desc = "Next class start" },
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
