return {
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml.ansible", "ansible" },
	root_markers = { "ansible.cfg", ".ansible-lint", "galaxy.yaml" },
	settings = {
		ansible = {
			python = {
				interpreterPath = "python3",
			},
			ansible = {
				path = "ansible",
			},
			executionEnvironment = {
				enabled = false,
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
				},
			},
		},
	},
}
