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

    end
}

