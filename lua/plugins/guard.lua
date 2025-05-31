return {
	"nvimdev/guard.nvim",
	config = function()
		local ft = require "guard.filetype"
		ft("c"):fmt("clang-format"):lint "clang-tidy"

		ft("lua"):fmt("stylua"):lint "selene"
		vim.keymap.set(
			{ "n", "v" },
			"<leader>fo",
			"<cmd>Guard fmt<cr>",
			{ desc = "Format" }
		)

		local is_formatting = false
		local guard_status = function()
			-- display icon if auto-format is enabled for current buffer
			local au = vim.api.nvim_get_autocmds {
				group = "Guard",
				buffer = 0,
			}
			if ft[vim.bo.ft] and #au ~= 0 then
				return is_formatting and "" or ""
			end
			return ""
		end

		-- selene: allow(global_usage)
		_G.guard_status = guard_status

		-- sets a super simple statusline when entering a buffer
		vim.cmd "au BufEnter * lua vim.opt.stl = [[%f %m ]] .. guard_status()"
		vim.api.nvim_create_autocmd("User", {
			pattern = "GuardFmt",
			callback = function(opt)
				-- receive data from opt.data
				is_formatting = opt.data.status == "pending"
				vim.opt.stl = [[%f %m ]] .. guard_status()
			end,
		})

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

		vim.g.guard_config = {
			fmt_on_save = true,
			lsp_as_default_formatter = false,
			save_on_fmt = false,
			auto_lint = true,
			lint_interval = 250,
			refresh_diagnostic = true,
		}
	end,
}
