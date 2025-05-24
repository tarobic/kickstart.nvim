return {
   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
   {
      "catppuccin/nvim",
      lazy = true,
   },
   {
      "rebelot/kanagawa.nvim",
      lazy = true,
   },
   -- Treesitter combatible:
   {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
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
      "Mofiqul/dracula.nvim",
      lazy = true,
   },
}
