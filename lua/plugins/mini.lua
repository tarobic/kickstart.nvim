return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup { n_lines = 500 }
		require("mini.diff").setup()
		require("mini.git").setup()
		require("mini.icons").setup()
		require("mini.pairs").setup {
			opts = {
				modes = { insert = true, command = true, terminal = false },
				-- skip autopair when next character is one of these
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				-- skip autopair when the cursor is inside these treesitter nodes
				skip_ts = { "string" },
				-- skip autopair when next character is closing pair
				-- and there are more closing pairs than opening pairs
				skip_unbalanced = true,
				-- better deal with markdown code blocks
				markdown = true,
			},
		}

		require("mini.surround").setup()
		require("mini.statusline").setup {
			use_icons = vim.g.have_nerd_font,
			section_location = function() return "%2l:%-2v %P" end,
		}
	end,
}
