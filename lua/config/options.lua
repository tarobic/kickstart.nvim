vim.g.have_nerd_font = true

vim.o.number = true
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250

-- Wrap oions
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "+++ "

-- This affects both:
-- How long to wait between leader-w to show which-key menu.
-- How quickly to press leader-e to toggle neotree while neotree is focused.
vim.o.timeoutlen = 200
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.showmode = false
vim.o.winborder = "rounded"
vim.o.mousefocus = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Folds
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "3"
vim.o.foldlevelstart = 99

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.schedule(function()
   vim.o.clipboard = "unnamedplus"
end)

vim.cmd "set noexpandtab"
vim.cmd "set tabstop=3"
vim.cmd "set softtabstop=0"
vim.cmd "set shiftwidth=0"
vim.cmd "set smarttab"
vim.cmd "set autoindent"
vim.cmd "set smartindent"
vim.cmd "set nocindent"

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function()
      vim.hl.on_yank()
   end,
})

-- Disable folding in Telescope's result window.
vim.api.nvim_create_autocmd(
   "FileType",
   { pattern = "TelescopeResults", command = [[setlocal nofoldenable]] }
)
