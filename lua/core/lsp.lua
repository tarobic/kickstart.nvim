vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		-- require("lazydev").find_workspace(args.buf)

		-- lsp keymaps
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(
				mode,
				keys,
				func,
				{ buffer = args.buf, desc = "LSP: " .. desc }
			)
		end

		if client:supports_method "textDocument/implementation" then
			map("gl", vim.lsp.buf.implementation, "List implementations")
		end

		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		-- if client:supports_method "textDocument/completion" then
		--    -- Optional: trigger autocompletion on EVERY keypress. May be slow!
		--    local chars = {}
		--    for i = 32, 126 do
		--       table.insert(chars, string.char(i))
		--    end
		--    client.server_capabilities.completionProvider.triggerCharacters = chars
		--
		--    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		--    vim.cmd "set completeopt+=menu,menuone,noinsert,popup,preinsert"
		--
		--    map("<C-space>", vim.lsp.completion.get, "Show Autocomplete Menu", "i")
		-- end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		-- if
		-- 	 not client:supports_method "textDocument/willSaveWaitUntil"
		-- 	 and client:supports_method "textDocument/formatting"
		-- then
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
		-- 		buffer = args.buf,
		-- 		callback = function()
		-- 			vim.lsp.buf.format {
		-- 				bufnr = args.buf,
		-- 				id = client.id,
		-- 				timeout_ms = 1000,
		-- 			}
		-- 		end,
		-- 	})
		-- end
		--
		-- -- Auto-format keymap
		-- vim.keymap.set("n", "<leader>fo", function()
		-- 	vim.lsp.buf.format {
		-- 		async = true,
		-- 		bufnr = args.buf,
		-- 		id = client.id,
		-- 	}
		-- end, { buffer = args.buf, desc = "LSP: Format buffer" })

		-- inlay hints
		if client:supports_method "textDocument/inlayHint" then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end

		-- Highlight word under cursor.
		if
			client
			and client:supports_method(
				vim.lsp.protocol.Methods.textDocument_documentHighlight,
				args.buf
			)
		then
			local highlight_augroup =
				vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = args.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = args.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds {
						group = "lsp-highlight",
						buffer = event.buf,
					}
				end,
			})
		end
	end,
})

-- Enable lsp files.
local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
	local server_name = vim.fn.fnamemodify(f, ":t:r")
	table.insert(lsp_configs, server_name)
end

-- Run a function when starting new lsp
-- vim.lsp.config("lua_ls", {
--    on_init = function()
--       print "lua_ls now runs in the background"
--    end,
-- })

vim.lsp.enable(lsp_configs)
