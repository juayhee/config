return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = "BufAdd",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "cpp", "lua", "vim" },
            sync_install = false,
            highlight = { enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = { enable = true },
        })

        -- Use treesitter for folding
        vim.cmd('set foldmethod=expr')
        vim.cmd('set foldexpr=nvim_treesitter$foldexpr()')
        vim.cmd('set nofoldenable')
    end
}
