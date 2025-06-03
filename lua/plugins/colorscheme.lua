return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
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
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = false,
		priority = 1000,
		opt = {
			transparent = true,
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_bg = true,
		},
	},
	{
		"vague2k/vague.nvim",
		name = "vague",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			enable = {
				legacy_highlights = false,
			},
			styles = {
				transparency = true,
			},
		},
	},
	{
		"abreujp/scholar.nvim",
		name = "scholar",
		lazy = false,
		priority = 1000,
		opts = { transparent_mode = true },
	},
	{ "nuvic/flexoki-nvim", name = "flexoki" },
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyCursorColor = true
			vim.g.moonflyTransparent = true
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "auto",
			transparent = true,
			-- borderless_pickers = true,
		},
	},
}
