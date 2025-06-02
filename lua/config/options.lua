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
	-- virtual_text = {
	-- 	-- source = "if_many",
	-- 	source = true,
	-- 	spacing = 2,
	-- 	format = function(diagnostic)
	-- 		local diagnostic_message = {
	-- 			[vim.diagnostic.severity.ERROR] = diagnostic.message,
	-- 			[vim.diagnostic.severity.WARN] = diagnostic.message,
	-- 			[vim.diagnostic.severity.INFO] = diagnostic.message,
	-- 			[vim.diagnostic.severity.HINT] = diagnostic.message,
	-- 		}
	-- 		return diagnostic_message[diagnostic.severity]
	-- 	end,
	-- 	current_line = true,
	-- },
}
