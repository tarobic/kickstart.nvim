return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = {
			lualine_b = { "searchcount" },
		},
		extension = {
			"lazy",
			"oil",
			"trouble",
		},
	},
}
