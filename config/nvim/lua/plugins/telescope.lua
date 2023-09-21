return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
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
        local utils = require('telescope.utils')

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
                        ['<C-w>s'] = actions.select_horizontal,
                        ['<C-w>v'] = actions.select_vertical,
                        ['<Tab>'] = actions.toggle_selection,
                        ['<leader>fq'] = actions.send_to_qflist + actions.open_qflist,
                        ['<leader>fw'] = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                }
            }
        })

        -- Global keymaps
        -- Lazy load on triggering these keys
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'All-file file search' })
        vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = '.gitignore aware file search' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Global string search' })
        vim.keymap.set('n', '<leader>fl', builtin.current_buffer_fuzzy_find, { desc = 'Local string search' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Open previous search' })

        -- These keys need to be registered before any LspAttach
        -- As a result lspconfig is dependent on telescope to load first
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                -- Keymaps in LSP-attached buffer
                local opts = { buffer = event.buf } -- Identifies the attached buffer
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, opts)
                vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', '<leader>gr', builtin.lsp_references, opts)
                vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gf', function() vim.lsp.buf.format { async = true } end, opts)
                vim.keymap.set('n', '<leader>gS', builtin.lsp_document_symbols, opts)
                vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', '<leader>gx', builtin.diagnostics, opts)
            end,
        })
    end
}
