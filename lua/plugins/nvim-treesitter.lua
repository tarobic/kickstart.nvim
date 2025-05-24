return { -- Highlight, edit, and navigate code
   "nvim-treesitter/nvim-treesitter",
   lazy = false,
   branch = "main",
   build = ":TSUpdate",
   -- require("nvim-treesitter").install {
   --    "c_sharp",
   --    "cpp",
   --    "gdscript",
   --    "gdshader",
   --    "gitignore",
   --    "glsl",
   --    "python",
   --    "rust",
   --    "toml",
   -- }
}
