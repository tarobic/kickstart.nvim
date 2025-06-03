return {
	{
		"catppuccin/nvim",
		priority = 1000,
		transparent_background = true,
		term_colors = true,
		integrations = {
			blink_cmp = true,
			noice = true,
			snacks = { enabled = true },
			lsp_trouble = true,
			which_key = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		transparent = true,
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
		config = function() vim.cmd "colorscheme rose-pine" end,
	},
	{ "abreujp/scholar.nvim" },
	{ "nuvic/flexoki-nvim", name = "flexoki" },
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "auto",
			transparent = true,
			-- borderless_pickers = true,
		},
	},
}
