return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.comment").setup()
		require("mini.diff").setup()
		require("mini.git").setup()
		require("mini.icons").setup()
		require("mini.move").setup()
		-- require("mini.notify").setup()
		require("mini.operators").setup()
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

		require("mini.splitjoin").setup { mappings = { toggle = "ms" } }
		require("mini.surround").setup()
		require("mini.starter").setup()
		require("mini.statusline").setup { use_icons = vim.g.have_nerd_font }
		require("mini.tabline").setup()
		require("mini.trailspace").setup()
	end,
}
