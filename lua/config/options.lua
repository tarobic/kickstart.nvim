vim.g.have_nerd_font = true

-- column/scrolling
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.scrolloff = 5
vim.o.sidescrolloff = 10
vim.o.cursorline = true

-- Wrap
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "+++ "

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
-- Auto cd to directory for file in current buffer.
vim.o.autochdir = false

-- Window
vim.o.winborder = "rounded"
vim.o.winblend = 30

-- Mouse
vim.o.mouse = "a"
vim.o.mousefocus = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Folds
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "0"
vim.o.foldlevelstart = 99

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Indentation
vim.o.expandtab = true
vim.o.tabstop = 3
vim.o.softtabstop = 3
vim.o.shiftwidth = 3
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

-- Show errors and warnings in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
   callback = function()
      vim.diagnostic.open_float(nil, { focusable = false, source = "if_many" })
   end,
})

-- Start in insert mode when entering terminal buffer.
vim.api.nvim_create_autocmd({ "TermOpen", "WinEnter" },
   { pattern = "term://*", command = "startinsert" }
)

-- Enable treesitter highlighting and folding.
vim.api.nvim_create_autocmd('FileType', {
   pattern = { '<filetype>' },
   callback = function()
      vim.treesitter.start()
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
   end,
})
