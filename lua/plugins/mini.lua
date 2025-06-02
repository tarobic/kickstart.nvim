return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup { n_lines = 500 }

		-- require("mini.indentscope").setup()
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

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		local statusline = require "mini.statusline"
		statusline.setup { use_icons = vim.g.have_nerd_font }

		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			-- return '%2l:%-2v'
			return "%2l:%-2v %P"
		end
	end,
}
