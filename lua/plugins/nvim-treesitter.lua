return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ensureInstalled = {
			"c",
			"c_sharp",
			"cmake",
			"cpp",
			"css",
			"fish",
			"gdscript",
			"gdshader",
			"gitignore",
			"glsl",
			"html",
			"latex",
			"lua",
			"make",
			"norg",
			"python",
			"regex",
			"rust",
			"scss",
			"svelte",
			"toml",
			"tsx",
			"typst",
			"vue",
			"yaml",
		}
		-- Install parsers
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(
				function(parser)
					return not vim.tbl_contains(alreadyInstalled, parser)
				end
			)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
}
