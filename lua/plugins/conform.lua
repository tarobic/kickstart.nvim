return { -- Autoformat
	"stevearc/conform.nvim",
	-- enabled = false,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fo",
			function()
				require("conform").format {
					async = true,
					lsp_format = "fallback",
				}
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			-- local disable_filetypes = { c = true, cpp = true }
			local disable_filetypes = {}
			if disable_filetypes[vim.bo[bufnr].filetype] then
				return nil
			else
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = function(bufnr)
				if
					require("conform").get_formatter_info("ruff_format", bufnr).available
				then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			c = { "clang-format" },
			cpp = { "clang-format" },
			csharp = { "csharpier" },
			gdscript = { "gdformat" },
			rust = { "rustfmt" },
			["_"] = { "trim_whitespace" },
		},
		-- formatters = {
		--   stylua = {
		--     options = {
		--       column_width = 80,
		--       indent_width = 2,
		--       indent_type = "Tabs",
		--     },
		--   },
		-- },
	},
}
