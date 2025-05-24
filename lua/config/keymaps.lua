vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.setloclist,
	{ desc = "Open diagnostic [Q]uickfix list" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- vim.keymap.set('n', '<leader>q', '<C-w>q', { desc = 'Quit window' })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Windows" })

-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Little terminal
local job_id = 0
vim.keymap.set("n", "<leader>lt", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd "J"
	vim.api.nvim_win_set_height(0, 15)

	job_id = vim.bo.channel
end, { desc = "Little Terminal" })

-- Run a custom command in little terminal
vim.keymap.set("n", "<leader>lc", function()
	-- Replace 'ls -al' with make, go build, etc.
	vim.fn.chansend(job_id, { "ls -al\r\n" })
end, { desc = "Terminal command" })

-- vim.keymap.set({ "n", "v" }, "<leader>dh", function()
--    require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
--    require("dap.ui.widgets").preview()
-- end)
-- vim.keymap.set("n", "<Leader>df", function()
--    local widgets = require "dap.ui.widgets"
--    widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
--    local widgets = require "dap.ui.widgets"
--    widgets.centered_float(widgets.scopes)
-- end)

vim.keymap.set("n", "<leader>bd", function()
	for _, buffer in pairs(vim.fn.getbufinfo()) do
		if buffer.hidden == 1 then
			vim.cmd.bd(buffer.bufnr)
		end
	end
end, { desc = "Clear all hidden buffers", silent = false })

-- Move by screen lines. Helps with wrapped lines.
vim.keymap.set("n", "gk", "<Up>")
vim.keymap.set("n", "gj", "<Down>")

-- Source current file.
vim.keymap.set("n", "<space>x", "<cmd>source % <CR>")
-- Execute current line.
vim.keymap.set("n", "<space>X", ":.lua<CR>")
-- Execute selected lines.
vim.keymap.set("v", "<space>X", ":lua<CR>")
