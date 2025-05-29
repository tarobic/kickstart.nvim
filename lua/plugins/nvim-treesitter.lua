return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	install = {
		"c_sharp",
		"cpp",
		"gdscript",
		"gdshader",
		"gitignore",
		"glsl",
		"python",
		"regex",
		"rust",
		"toml",
		"norg",
	},
}
