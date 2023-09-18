return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'williamboman/mason.nvim'
    },
    -- Do not setup() here, set up in lspconfig
    config = false,
}
