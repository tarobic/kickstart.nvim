vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.showmode = false
vim.opt.winborder = 'rounded'

vim.schedule(function()
   vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Keymaps ]]
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.cmd("set expandtab")
vim.cmd("set tabstop=3")
vim.cmd("set softtabstop=3")
vim.cmd("set shiftwidth=3")

vim.cmd.colorscheme = "catppuccin"
