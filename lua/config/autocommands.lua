-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup(
		"kickstart-highlight-yank",
		{ clear = true }
	),
	callback = function() vim.hl.on_yank() end,
})

-- Show errors and warnings in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false, source = "all" })
	end,
})

-- Start in insert mode when entering terminal buffer.
vim.api.nvim_create_autocmd(
	{ "TermOpen", "WinEnter" },
	{ pattern = "term://*", command = "startinsert" }
)

-- Enable treesitter highlighting, indenting, and folding.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
-- local progress = vim.defaulttable()
-- vim.api.nvim_create_autocmd("LspProgress", {
-- 	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
-- 		if not client or type(value) ~= "table" then return end
-- 		local p = progress[client.id]
--
-- 		for i = 1, #p + 1 do
-- 			if i == #p + 1 or p[i].token == ev.data.params.token then
-- 				p[i] = {
-- 					token = ev.data.params.token,
-- 					msg = ("[%3d%%] %s%s"):format(
-- 						value.kind == "end" and 100 or value.percentage or 100,
-- 						value.title or "",
-- 						value.message and (" **%s**"):format(value.message) or ""
-- 					),
-- 					done = value.kind == "end",
-- 				}
-- 				break
-- 			end
-- 		end
--
-- 		local msg = {} ---@type string[]
-- 		progress[client.id] = vim.tbl_filter(
-- 			function(v) return table.insert(msg, v.msg) or not v.done end,
-- 			p
-- 		)
--
-- 		local spinner = {
-- 			"⠋",
-- 			"⠙",
-- 			"⠹",
-- 			"⠸",
-- 			"⠼",
-- 			"⠴",
-- 			"⠦",
-- 			"⠧",
-- 			"⠇",
-- 			"⠏",
-- 		}
-- 		vim.notify(table.concat(msg, "\n"), "info", {
-- 			id = "lsp_progress",
-- 			title = client.name,
-- 			opts = function(notif)
-- 				notif.icon = #progress[client.id] == 0 and " "
-- 					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
-- 			end,
-- 		})
-- 	end,
-- })

-- Remove options that continue comment leader on new line.
-- Run "verb set formatoptions" to see which file last set this
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function() vim.o.formatoptions = "jql" end,
})

-- Toggle LazyDev depending on buffer directory.
-- autochdir may affect this.
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.lua",
	callback = function()
		-- vim.notify "~~~~~~~~~~~"
		for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
			-- vim.notify(dir)
			for _, lazyDir in ipairs { ".config/nvim", "nvim_plugins" } do
				if string.find(dir, lazyDir) then
					vim.g.lazydev_enabled = true
					vim.g.lua_subversion = 1
					return
				end
			end
		end
		vim.g.lazydev_enabled = false
		vim.lsp.config.lua = { runtime = { version = "Lua 5.4" } }
		vim.g.lua_subversion = 4
	end,
})

-- Auto split help windows vertically.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd H",
})

do
	-- Mini.Git statusline
	-- Use only HEAD name as summary string
	local format_summary = function(data)
		-- Utilize buffer-local table summary
		local summary = vim.b[data.buf].minigit_summary
		vim.b[data.buf].minigit_summary_string = summary.head_name or ""
	end

	local au_opts = { pattern = "MiniGitUpdated", callback = format_summary }
	vim.api.nvim_create_autocmd("User", au_opts)
end

do
	-- Mini.Diff statusline
	local format_summary = function(data)
		local summary = vim.b[data.buf].minidiff_summary
		local t = {}
		if summary.add > 0 then table.insert(t, "+" .. summary.add) end
		if summary.change > 0 then table.insert(t, "~" .. summary.change) end
		if summary.delete > 0 then table.insert(t, "-" .. summary.delete) end
		vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
	end
	local au_opts = { pattern = "MiniDiffUpdated", callback = format_summary }
	vim.api.nvim_create_autocmd("User", au_opts)
end

-- Only start treesitter if current filetype supports it. (Dashboard was throwing an error)
vim.api.nvim_create_autocmd("FileType", {
	callback = function(details)
		local bufnr = details.buf
		if not pcall(vim.treesitter.start, bufnr) then -- try to start treesitter which enables syntax highlighting
			return -- Exit if treesitter was unable to start
		end
		vim.bo[bufnr].syntax = "on" -- Use regex based syntax-highlighting as fallback as some plugins might need it
		vim.wo.foldlevel = 99
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folds
		vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
	end,
})
