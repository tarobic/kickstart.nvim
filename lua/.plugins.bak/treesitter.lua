return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "bash", "c", "cpp", "cmake", "c_sharp", "fish",
          "gdscript", "gdshader", "glsl", "go", "javascript", "lua", "make",
            "python", "rust", "toml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
