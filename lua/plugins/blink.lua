return { -- Autocompletion
	"saghen/blink.cmp",
	-- enabled = false,
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		{ "echasnovski/mini.snippets" },
		"folke/lazydev.nvim",
	},
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		appearance = { nerd_font_variant = "mono" },
		completion = {
			-- documentation = { auto_show = true, auto_show_delay_ms = 500 },
			documentation = { auto_show = true },
			accept = { auto_brackets = { enabled = false } },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				lazydev = {
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		snippets = { preset = "mini_snippets" },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
	opt_extend = { "sources.default" },
}
