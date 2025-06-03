local function isDefaultScheme(name) return name == DefaultColorScheme end

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = isDefaultScheme "catppuccin",
		priority = isDefaultScheme "catppuccin" and 1000 or 0,
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
		name = "kanagawa",
		lazy = isDefaultScheme "kanagawa",
		priority = isDefaultScheme "kanagawa" and 1000 or 0,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = isDefaultScheme "tokyonight",
		priority = isDefaultScheme "tokyonight" and 1000 or 0,
		transparent = true,
	},
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
	},
	{
		"vague2k/vague.nvim",
		name = "vague",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{ "abreujp/scholar.nvim", name = "scholar" },
	{ "nuvic/flexoki-nvim", name = "flexoki" },
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
	},
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		opts = {
			variant = "auto",
			transparent = true,
			-- borderless_pickers = true,
		},
	},
}
