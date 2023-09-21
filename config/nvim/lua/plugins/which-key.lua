return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        local wk = require('which-key')
        -- LSP bindings
        wk.register({
            ['<leader>'] = {
                g = {
                    name = 'LSP',
                    D = { 'List declarations' },
                    d = { 'List definitions' },
                    t = { 'List type definitions' },
                    r = { 'List references' },
                    h = { 'Hover over this symbol' },
                    s = { 'Signature help' },
                    n = { 'Rename symbol' },
                    a = { 'View code actions' },
                    f = { 'Format code' },
                    S = { 'List symbols in this file' },
                    i = { 'Go to implementation' },
                    x = { 'Open diagnostic information for this file' }
                },
                f = {
                    name = 'Telescope'
                },
                a = {
                    name = 'Annotate',
                },
                w = {
                    name = 'Focus',
                },
            },
            { mode = 'n' }
        })
    end
}
