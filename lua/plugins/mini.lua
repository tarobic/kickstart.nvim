return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local ai = require "mini.ai"
		ai.setup {
			custom_textobjects = {
				-- Lua block
				s = { "%[%[().-()%]%]" },
				-- Function definition
				F = ai.gen_spec.treesitter {
					a = "@function.outer",
					i = "@function.inner",
				},
			},
		}
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

		local starter = require "mini.starter"
		starter.setup {
			evaluate_single = true,
			header = table.concat({
				[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
				[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
				[[/ /\  /  __/ (_) \ V /| | | | | | |]],
				[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
				[[───────────────────────────────────]],
			}, "\n"),
			footer = os.date(),
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.aligning("center", "center"),
			},
			query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
			items = {
				{ action = "che", name = "Health", section = "Bonus" },
				{ action = "Lazy", name = "Lazy", section = "Bonus" },
				{
					action = ":lua Snacks.picker.help()",
					name = "h: Help",
					section = "Bonus",
				},
				{
					action = ":lua Snacks.lazygit()",
					name = "Git",
					section = "Bonus",
				},
				{ action = ":Typr", name = "Typr", section = "Bonus" },
				{ action = ":TyprStats", name = "Typr Stats", section = "Bonus" },
				starter.sections.recent_files(5, false, true),
				starter.sections.recent_files(5, true, false),
				--TODO: setup mini sessions and picker
				-- starter.sections.sessions(),
				-- starter.sections.pick(),
				starter.sections.builtin_actions(),
			},
		}

		require("mini.statusline").setup { use_icons = vim.g.have_nerd_font }
		-- require("mini.tabline").setup()
		require("mini.trailspace").setup()
	end,
}
