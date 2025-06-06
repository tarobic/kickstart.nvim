vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.setloclist,
	{ desc = "Quickfix list" }
)

vim.keymap.set("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set(
	"n",
	"<C-h>",
	"<C-w><C-h>",
	{ desc = "Move focus to the left window" }
)
vim.keymap.set(
	"n",
	"<C-l>",
	"<C-w><C-l>",
	{ desc = "Move focus to the right window" }
)
vim.keymap.set(
	"n",
	"<C-j>",
	"<C-w><C-j>",
	{ desc = "Move focus to the lower window" }
)
vim.keymap.set(
	"n",
	"<C-k>",
	"<C-w><C-k>",
	{ desc = "Move focus to the upper window" }
)

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Windows" })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

local function openLittleTerminal()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd "J"
	vim.api.nvim_win_set_height(0, 15)

	return vim.bo.channel
end

-- Run a custom command in little terminal
vim.keymap.set("n", "<leader>lc", function()
	-- Replace 'ls -al' with make, go build, etc.
	local job_id = openLittleTerminal()
	vim.fn.chansend(job_id, { "ls -al\r\n" })
end, { desc = "Terminal command" })

vim.keymap.set("n", "<leader>ll", function()
	local job_id = openLittleTerminal()
	vim.fn.chansend(job_id, { "lua " .. vim.fn.expand "%" })
end, { desc = "Run current lua file" })

vim.keymap.set("n", "<leader>bd", function()
	for _, buffer in pairs(vim.fn.getbufinfo()) do
		if buffer.hidden == 1 then vim.cmd.bd(buffer.bufnr) end
	end
end, { desc = "Clear all hidden buffers", silent = false })

-- Move by screen lines. Helps with wrapped lines.
vim.keymap.set("n", "gk", "<Up>")
vim.keymap.set("n", "gj", "<Down>")

-- Source current file.
vim.keymap.set("n", "<leader>rx", "<cmd>source % <CR>")
-- Execute current line.
-- vim.keymap.set("n", "<space>X", ":.lua<CR>")
-- Execute selected lines.
-- vim.keymap.set("v", "<space>X", ":lua<CR>")

vim.keymap.set(
	"n",
	"<Leader>Sl",
	function() require("persistence").load { last = true } end,
	{ desc = "Load last session" }
)
vim.keymap.set(
	"n",
	"<Leader>Ss",
	function() require("persistence").select() end,
	{ desc = "Select session" }
)
vim.keymap.set(
	"n",
	"<Leader>Sq",
	function() require("persistence").stop() end,
	{ desc = "Don't save session (Stop persistence)" }
)

vim.keymap.set(
	"n",
	"<Leader>L",
	function() require("lazy").home() end,
	{ desc = "Lazy" }
)

-- vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>")

-- Menu
-- Keyboard users
vim.keymap.set("n", "<C-t>", function() require("menu").open "default" end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
	require("menu.utils").delete_old_menus()

	vim.cmd.exec '"normal! \\<RightMouse>"'

	-- clicked buf
	local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
	local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

	require("menu").open(options, { mouse = true })
end, {})
