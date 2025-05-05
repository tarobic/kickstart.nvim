-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle reveal_force_cwd<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>o', ':Neotree focus<CR>', desc = 'Neotree focus', silent = true },
  },
  -- opts = {
  --   filesystem = {
  --     window = {
  --       mappings = {
  --         ['<leader>\\'] = 'close_window',
  --       },
  --     },
  --   },
  -- },
}
