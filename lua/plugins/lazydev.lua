return {
	-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
	-- used for completion, annotations and signatures of Neovim apis
	"folke/lazydev.nvim",
	-- enabled = false,
	-- TODO: disable when not in sub directory of nvim config.
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			-- { path = "snacks.nvim", words = { "Snacks" } },
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
		integrations = {
			lspconfig = false,
			blink = true,
		},
	},
	-- enabled = function ()
	-- 	for dir in vim.fs.parents (vim.api.nvim_buf_get_name (0)) do
	-- 		if vim.fs.dirname (dir) == "nvim" then
	-- 			vim.notify  "✔️ config dir"
	-- 			return true
	-- 		end
	-- 	end
	--
	-- 	vim.notify  "❌ config dir"
	-- 	return false
	-- end,
}
