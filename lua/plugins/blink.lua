return { -- Autocompletion
    "saghen/blink.cmp",
    -- enabled = false,
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        { "echasnovski/mini.snippets" },
        -- "folke/lazydev.nvim",
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        appearance = { nerd_font_variant = "mono", },
        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
        },
        sources = {
            -- default = { "lsp", "path", "snippets", "lazydev" },
            -- providers = {
            --     lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            -- },
            default = { "lsp", "path", "snippets", "buffer" },
        },
        snippets = { preset = "mini_snippets" },
        fuzzy = { implementation = "prefer_rust_with_warning" },

        -- Shows a signature help window while you type arguments for a function
        signature = { enabled = true },
    },
}
