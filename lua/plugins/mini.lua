return { -- Collection of various small independent plugins/modules
   "echasnovski/mini.nvim",
   version = false,
   config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require "mini.statusline"
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
         -- return '%2l:%-2v'
         return "%2l:%-2v %P"
      end

      -- require("mini.indentscope").setup()
      require "mini.icons".setup()

      require "mini.pairs".setup {
         opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
         }
      }

      local gen_loader = require("mini.snippets").gen_loader
      require("mini.snippets").setup({
         snippets = {
            -- Load custom file with global snippets first (adjust for Windows)
            gen_loader.from_file("~/.config/nvim/snippets/global.json"),

            -- Load snippets based on current language by reading files from
            -- "snippets/" subdirectories from 'runtimepath' directories.
            gen_loader.from_lang(),
         },
      })

      -- require("mini.completion").setup()
      require("mini.sessions").setup()
   end,
}
