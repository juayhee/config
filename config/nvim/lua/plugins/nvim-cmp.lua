return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        -- lsp-zero autocompletion preconfiguration - sets defaults for any possible unset options
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_cmp()

        -- nvim-cmp main configuration
        local cmp = require('cmp')
        local cmp_action = lsp_zero.cmp_action()

        cmp.setup({
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<Esc>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            })

        })
    end
}
