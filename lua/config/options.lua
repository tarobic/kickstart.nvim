vim.g.have_nerd_font = true

-- column/scrolling
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "auto"
vim.o.scrolloff = 5
vim.o.sidescrolloff = 10
vim.o.cursorline = true

-- Wrap
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = " "

-- Misc
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"
vim.o.confirm = true
vim.o.showmode = false
vim.o.undofile = true
-- This affects both:
-- How long to wait between leader-w to show which-key menu.
-- How quickly to press leader-e to toggle neotree while neotree is focused.
vim.o.timeoutlen = 200
vim.o.updatetime = 250
vim.o.clipboard = "unnamedplus"
vim.o.virtualedit = "block"
vim.o.termguicolors = true
vim.o.autochdir = true
vim.o.smoothscroll = true

-- Netrw disable
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_netrw_gitignore = 1

-- Window
vim.o.winborder = "rounded"
vim.o.winblend = 15

-- Mouse
vim.o.mouse = "a"
vim.o.mousefocus = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Folds
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "auto:1"
vim.o.foldlevelstart = 99

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = {
	tab = " ",
	trail = "·",
	extends = "",
	nbsp = "␣",
}

-- Indentation
vim.o.expandtab = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cindent = false

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
	callback = function()
		vim.hl.on_yank()
	end,
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
-- require "nvim-treesitter".install {
--     "c_sharp",
--     "cpp",
--     "gdscript",
--     "gdshader",
--     "gitignore",
--     "glsl",
--     "python",
--     "regex",
--     "rust",
--     "toml",
-- }
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = {
			"⠋",
			"⠙",
			"⠹",
			"⠸",
			"⠼",
			"⠴",
			"⠦",
			"⠧",
			"⠇",
			"⠏",
		}
		vim.notify(table.concat(msg, "\n"), "info", {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
					or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		-- source = "if_many",
		source = true,
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
		current_line = true,
	},
}

-- Remove options that continue comment leader on new line.
-- Run "verb set formatoptions" to see which file last set this
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.o.formatoptions = "jql"
	end,
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
