vim.g.mapleader = " "

-- Move visual blocks
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

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

-- Quickfix navigation
vim.keymap.set('n', '<C-k>', '<cmd>cnext<cr>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<cr>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<cr>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<cr>zz')
