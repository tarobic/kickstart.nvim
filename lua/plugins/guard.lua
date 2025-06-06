return {
	"nvimdev/guard.nvim",
	config = function()
		local ft = require "guard.filetype"
		ft("c"):fmt("clang-format"):lint "clang-tidy"
		ft("lua"):fmt("stylua"):lint "selene"

		-- Dynamic formatting
		-- ft("c"):fmt(function()
		-- 	if vim.uv.fs_stat ".clang-format" then
		-- 		return {
		-- 			cmd = "clang-format",
		-- 			stdin = true,
		-- 		}
		-- 	else
		-- 		return {
		-- 			cmd = "clang-format",
		-- 			args = {
		-- 				("--style={BasedOnStyle: llvm, IndentWidth: %d, TabWidth: %d, UseTab: %s}"):format(
		-- 					vim.bo.shiftwidth,
		-- 					vim.bo.tabstop,
		-- 					vim.bo.expandtab and "Never" or "Always"
		-- 				),
		-- 			},
		-- 			stdin = true,
		-- 		}
		-- 	end
		-- end)

		-- vim.g.guard_config = {
		-- 	fmt_on_save = true,
		-- 	lsp_as_default_formatter = false,
		-- 	save_on_fmt = false,
		-- 	auto_lint = true,
		-- 	lint_interval = 250,
		-- 	refresh_diagnostic = true,
		-- }
	end,
}
