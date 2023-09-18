return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim' },
    keys = {
        { '<leader>ff' },
        { '<leader>fs' },
        { '<leader>fr' }
    },
    config = function()
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                -- Keymaps in Telescope buffer
                mappings = {
                    i = {
                        -- Disable moving around the telescope buffer in insert
                        ['<tab>'] = false,
                    },
                    n = {
                        ['<C-v>'] = false,
                        ['<M-v>'] = actions.select_vertical,
                        ['<C-s>'] = false,
                        ['<M-s>'] = actions.select_horizontal,
                        ['<Tab>'] = actions.toggle_selection,
                        ['<C-q>'] = false,
                        ['<M-q>'] = false,
                        ['<leader>fq'] = actions.send_to_qflist + actions.open_qflist,
                        ['<leader>fw'] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        -- Global keymaps
        -- Lazy load on triggering these keys
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fs', builtin.live_grep)
        vim.keymap.set('n', '<leader>fr', builtin.resume)

        -- These keys need to be registered before any LspAttach
        -- As a result lspconfig is dependent on telescope to load first
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                print("test")
                -- Keymaps in LSP-attached buffer
                local opts = { buffer = event.buf } -- Identifies the attached buffer
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
                vim.keymap.set('n', 'gtd', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
                vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gf', function() vim.lsp.buf.format {async=true} end, opts)
                vim.keymap.set('n', 'gs', builtin.lsp_document_symbols, opts)
                vim.keymap.set('n', 'gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', 'gq', builtin.diagnostics, opts)
            end,
        })
    end
}

