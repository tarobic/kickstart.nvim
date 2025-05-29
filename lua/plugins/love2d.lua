return {
	"S1M0N38/love2d.nvim",
	enabled = false,
	event = "VeryLazy",
	opts = {
		-- path_to_love_bin = "love",
		-- path_to_love_library = vim.fn.globpath(vim.o.runtimepath, "love2d/library"),
		-- path_to_love_library = "usr/lib/lua-language-server/meta/3rd/love2d/",
		-- restart_on_save = false,
		-- debug_window_opts = {
		--    split = "below",
		-- },
	},
	keys = {
		{ "<leader>v", ft = "lua", desc = "LÖVE" },
		{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
		{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
	},
}
