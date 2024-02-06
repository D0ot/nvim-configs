-- enable treesitter for orgmode
require("orgmode").setup_ts_grammar()

-- Setup orgmode
require("orgmode").setup({
	org_agenda_files = "~/orgfiles/**/*",
	org_default_notes_file = "~/orgfiles/refile.org",

	org_todo_keywords = { "TODO", "DOING", "|", "DONE", "NOTE", "AGAIN" },
})
