return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = languages
         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconfig = require("lspconfig")
         lspconfig.clangd.setup {}
         lspconfig.gopls.setup {}
         lspconfig.lua_ls.setup {}
         lspconfig.pyright.setup {}
         lspconfig.rust_analyzer.setup {}
      end
   }
}
