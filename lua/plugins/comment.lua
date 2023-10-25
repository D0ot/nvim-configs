local comment = require("Comment")

comment.setup({
	padding = true,
	sticky = true,
	mappings = {
		basic = false,
		extra = false,
		extended = false,
	},

	pre_hook = nil,
	post_hook = nil,
})
