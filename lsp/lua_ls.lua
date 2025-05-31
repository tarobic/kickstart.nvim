return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".git",
		".luacheckrc",
		".luarc.json",
		".luarc.jsonc",
		".stylua.toml",
		"selene.toml",
		"selene.yml",
		"stylua.toml",
	},
	settings = {
		Lua = {
			completion = {
				autoRequire = true,
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim", "love", "Snacks" },
				workspaceDelay = 1000,
				-- workspaceEvent = "OnChange",
			},
			format = {
				enable = false,
				defaultConfig = {
					indent_style = "tabs",
					indent_size = "3",
					tab_width = "3",
					quote_style = "double",
					max_line_length = "80",
					end_of_line = "auto",
					auto_collapse_lines = "false",
				},
			},
			hint = {
				enable = true,
				setType = false,
			},
			type = {
				inferParamType = true,
			},
			workspace = {
				library = {
					"${3rd}/love2d/library",
				},
			},
		},
	},
}
