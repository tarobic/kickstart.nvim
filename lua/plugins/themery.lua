return {
	"zaldih/themery.nvim",
	enabled = false,
	lazy = false,
	config = function()
		require("themery").setup {
			livePreview = true,
			themes = vim.fn.getcompletion("", "color"),
		}
	end,
}
