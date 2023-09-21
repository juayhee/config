vim.g.mapleader = ' '

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Press enter again to clear search highlights
vim.keymap.set('n', '<esc>', '<cmd>noh<cr><esc>')

-- Re-centre cursor after jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Yank to system clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>Y', '\"+Y')

-- Windows
vim.keymap.set('n', '<C-H>', '<cmd>vertical :res -10<cr>')
vim.keymap.set('n', '<C-L>', '<cmd>vertical :res +10<cr>')
vim.keymap.set('n', '<C-J>', '<cmd>:res -10<cr>')
vim.keymap.set('n', '<C-K>', '<cmd>:res +10<cr>')

-- Quickfix list navigation
vim.api.nvim_create_augroup('Quickfix', {
    clear = true,})

vim.api.nvim_create_autocmd({'FileType'}, {
    group = 'Quickfix',
    pattern = 'qf',
    desc = 'Quickfix list local navigation keybinds',
    callback = function()
        vim.keymap.set('n', 'j', function()
            vim.cmd('lnext')
            vim.cmd('wincmd p')
        end, { buffer = 0 })
        vim.keymap.set('n', 'k', function()
            vim.cmd('lprev')
            vim.cmd('wincmd p')
        end, { buffer = 0 })
        vim.keymap.set('n', '<cr>', function()
            vim.cmd('lclose')
        end, { buffer = 0 })
    end
})

vim.keymap.set('n', '<leader>q', '<cmd>lopen<cr>', { desc = 'Open location list' })
