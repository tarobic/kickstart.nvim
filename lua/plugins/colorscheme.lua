return {
	{
		"catppuccin/nvim",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		-- config = function()
		--   ---@diagnostic disable-next-line: missing-fields
		--   require('tokyonight').setup {
		--     styles = {
		--       comments = { italic = false }, -- Disable italics in comments
		--     },
		--   }
		-- end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
	},
	{
		"vague2k/vague.nvim",
		priority = 1000,
		-- lua/plugins/rose-pine.lua
	},
	{
		"rose-pine/neovim",
		priority = 1000,
		name = "rose-pine",
		config = function()
			vim.cmd "colorscheme rose-pine"
		end,
	},
	{ "abreujp/scholar.nvim" },
}
