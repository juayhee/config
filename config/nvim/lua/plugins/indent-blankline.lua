return {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
        vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"

        require("indent_blankline").setup {
            space_char_blankline = " ",
            show_current_context = true,
            show_current_context_start = true,
        }
        -- Highlights for indent line
        vim.cmd('highlight IndentBlanklineChar guifg=#282727')

        -- Highlights for indent line in current context
        vim.cmd('highlight IndentBlanklineContextChar guifg=#b98d7b')
    end
}
