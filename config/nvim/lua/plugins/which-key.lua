return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        local wk = require('which-key')
        -- LSP bindings
        wk.register({
            g = {
                name = 'LSP / default keybinds',
                D = { 'List declarations' },
                d = { 'List definitions' },
                t = {
                    d = { 'List type definitions' }
                },
                r = { 'List references' },
                k = { 'Hover over this symbol' },
                h = { 'Signature help' },
                n = { 'Rename symbol' },
                a = { 'View code actions' },
                f = { 'Format code' },
                s = { 'List symbols in this file' },
                q = { 'Open diagnostic information for this file' }
            },
            { mode = 'n' }
        })

        -- Telescope bindings
        wk.register({
            ['<leader>'] = {
                f = {
                    f = { 'TSP: Find in workspace files' },
                    s = { 'TSP: Grep in workspace files' },
                    r = { 'TSP: Open previous search' },
                    q = { 'TSP: Send filtered to quickfix list' },
                    w = { 'TSP: Send selected to quickfix list' }
                }, { mode = 'n' } }
        })
    end
}
