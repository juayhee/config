return {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart'},
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'williamboman/mason.nvim',
        'hrsh7th/cmp-nvim-lsp'
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        -- Load installed servers from Mason

        require('mason').setup();
        require('mason-lspconfig').setup()
        require('mason-lspconfig').setup_handlers({
            function(server)
                lspconfig[server].setup{};
            end
        })
       
        -- Add autocompletion capabilities to whatever defaults exist
        lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                -- Keymaps in LSP-attached buffer
                -- LSP API functions which have Telescope support will have their keymaps defined
                -- in telescope.lua
                -- List of Telescope supported functions: https://github.com/nvim-telescope/telescope.nvim#neovim-lsp-pickers
                local opts = { buffer = event.buf } -- Identifies the attached buffer
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, 'ga', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', 'gf', function() vim.lsp.buf.format {async=true} end, opts)
            end,
        })
    end
}

