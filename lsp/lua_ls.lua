-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua

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
			completion = { callSnippet = "Replace", },
			diagnostics = {
				globals = { "vim", "love" },
				disable = {
					"missing-parameters",
					"missing-fields",
					"unused-function",
					"unused-local",
				},
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = "tabs",
					indent_size = "3",
					tab_width = "3",
					quote_style = "double",
					max_line_length = "80",
					end_of_line = "auto",
					auto_collapse_lines = "true",
				},
			},
			hint = { enable = true },
			-- runtime = {
			-- version = "Lua 5.4",
			-- version = "LuaJIT",
			-- },
			workspace = {
				library = {
					"${3rd}/love2d/library",
					-- vim.fn.globpath(vim.o.runtimepath, "love2d/library"),
				},
			},
		},
	},
}
