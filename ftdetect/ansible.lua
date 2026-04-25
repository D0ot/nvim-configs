-- Precise Ansible filetype detection
-- Project-based detection is the gate: only proceed if ansible.cfg is found

local function has_ansible_cfg(start_path)
	local check_dir = vim.fn.fnamemodify(start_path, ":h")
	for _ = 1, 3 do -- Limit depth
		if vim.fn.filereadable(check_dir .. "/ansible.cfg") == 1 then
			return true
		end
		local parent = vim.fn.fnamemodify(check_dir, ":h")
		if parent == check_dir then
			break
		end
		check_dir = parent
	end
	return false
end

local function detect_ansible(path, bufnr)
	-- Precheck: Must be in an Ansible project (ansible.cfg exists)
	if not has_ansible_cfg(path) then
		return nil
	end

	local name = vim.fn.fnamemodify(path, ":t")
	local dir = vim.fn.fnamemodify(path, ":h:t")
	local parent_dir = vim.fn.fnamemodify(path, ":h:h:t")

	-- Pattern 1: Files in ansible-specific directories
	local ansible_dirs = {
		["playbooks"] = true,
		["roles"] = true,
		["inventory"] = true,
		["group_vars"] = true,
		["host_vars"] = true,
		["tasks"] = true,
		["handlers"] = true,
		["vars"] = true,
		["defaults"] = true,
		["meta"] = true,
		["files"] = true,
		["templates"] = true,
		["lookup_plugins"] = true,
		["filter_plugins"] = true,
		["callback_plugins"] = true,
		["library"] = true,
		["module_utils"] = true,
	}

	if ansible_dirs[dir] or ansible_dirs[parent_dir] then
		return "yaml.ansible"
	end

	-- Pattern 2: Files with ansible-specific naming patterns
	local ansible_patterns = {
		"^site%.ya?ml$",
		"^playbook%.ya?ml$",
		"^main%.ya?ml$",
		"^local%.ya?ml$",
		"^requirements%.ya?ml$",
		"^hosts%.ya?ml$",
		"^inventory%.ya?ml$",
		"^galaxy%.ya?ml$",
		"^%.?ansible%-lint%.ya?ml$",
		"^molecule%.ya?ml$",
	}

	local lower_name = name:lower()
	for _, pattern in ipairs(ansible_patterns) do
		if lower_name:match(pattern) then
			return "yaml.ansible"
		end
	end

	-- Pattern 3: Content-based detection (only for .yml/.yaml files)
	if name:match("%.ya?ml$") and bufnr and vim.api.nvim_buf_is_valid(bufnr) then
		-- Read first 20 lines to check for Ansible-specific keys
		local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 20, false)
		local content = table.concat(lines, "\n")

		-- Strong indicators (must appear at top level or common locations)
		local strong_indicators = {
			"^%- hosts:",
			"^hosts:%s*",
			"^tasks:%s*",
			"^handlers:%s*",
			"^vars:%s*",
			"^vars_files:%s*",
			"^roles:%s*",
			"^become:%s*",
			"^gather_facts:%s*",
			"^%- name:%s*",
			"^ansible_",
		}

		for _, pattern in ipairs(strong_indicators) do
			if content:find(pattern) then
				return "yaml.ansible"
			end
		end
	end

	return nil
end

vim.filetype.add({
	extension = {
		yml = function(path, bufnr)
			return detect_ansible(path, bufnr) or "yaml"
		end,
		yaml = function(path, bufnr)
			return detect_ansible(path, bufnr) or "yaml"
		end,
	},
})
