return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufNewFile', 'BufReadPre' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'nvim-telescope/telescope.nvim' -- Telescope LSP keymaps must be registered first
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config
        local builtin = require('telescope.builtin')

        -- Add autocompletion capabilities to lspconfig exist
        lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
        )

        -- Load installed servers from Mason
        require('mason').setup();
        require('mason-lspconfig').setup()
        require('mason-lspconfig').setup_handlers({
            function(server)
                lspconfig[server].setup{};
            end
        })
        -- LSP related keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                -- Keymaps in LSP-attached buffer
                local opts = { buffer = event.buf } -- Identifies the attached buffer
                vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, opts)
                vim.keymap.set('n', '<leader>gt', builtin.lsp_type_definitions, opts)
                vim.keymap.set('n', '<leader>gr', builtin.lsp_references, opts)
                vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>gS', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>gn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gf', function() vim.lsp.buf.format { async = true } end, opts)
                vim.keymap.set('n', '<leader>gs', builtin.lsp_document_symbols, opts)
                vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, opts)
                vim.keymap.set('n', '<leader>gx', builtin.diagnostics, opts)
            end,
        })
    end
}

