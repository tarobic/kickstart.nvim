-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/lua_ls.lua

return {
   cmd = {
      "lua-language-server",
   },
   filetypes = {
      "lua",
   },
   root_markers = {
      ".git",
      ".luacheckrc",
      ".luarc.json",
      ".luarc.jsonc",
      ".stylua.toml",
      "selene.toml",
      "selene.yml",
      "stylua.toml",
   },
   settings = {
      Lua = {
         completion = {
            callSnippet = "Both",
            keywordSnippet = "Both",
         },
         diagnostics = {
            disable = { "missing-parameters", "missing-fields", "lowercase-global" },
         },
         format = {
            enable = false
         },
         hint = {
            enable = true,
         },
         runtime = {
            -- version = "5.4",
            version = "LuaJIT"
         },
         workspace = {
            library = {
               -- "${3rd}/love2d/library",
               vim.fn.globpath(vim.o.runtimepath, "love2d/library"),
            },
         },
      },
   },

   single_file_support = true,
   log_level = vim.lsp.protocol.MessageType.Warning,
}
