local function checkIfDefault(name)
   -- if DefaultColorscheme == name then
   --    return true, 1000
   -- end
   -- return false, 0
   return DefaultColorscheme == name
end

return {
   {
      "catppuccin/nvim",
      -- lazy, priority = checkIfDefault("catppuccin"),
      lazy = not checkIfDefault("catppuccin"),
   },
   {
      "rebelot/kanagawa.nvim",
      -- lazy, priority = checkIfDefault("kanagawa"),
      lazy = not checkIfDefault("kanagawa")
   },
   -- Treesitter combatible:
   {
      "folke/tokyonight.nvim",
      -- lazy, priority = checkIfDefault("tokyonight"),
      lazy = not checkIfDefault("tokyonight")
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
      -- lazy, priority = checkIfDefault("dracula"),
      lazy = not checkIfDefault("dracula")
   },
}
