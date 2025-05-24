return {
   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
   {
      "catppuccin/nvim",
      lazy = false,
      name = "catppuccin",
      priority = 1000,
   },
   {
      "folke/tokyonight.nvim",
      lazy = true,
      -- config = function()
      --   ---@diagnostic disable-next-line: missing-fields
      --   require('tokyonight').setup {
      --     styles = {
      --       comments = { italic = false }, -- Disable italics in comments
      --     },
      --   }
      -- end,
   },
   {
      "rebelot/kanagawa.nvim",
      lazy = true,
      name = "kanagawa"
   }
}
