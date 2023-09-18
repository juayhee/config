vim.g.mapleader = ' '

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

-- Windows
vim.keymap.set('n', '<M-v>', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<M-s>', '<cmd>split<cr>')

vim.keymap.set('n', '<M-h>', '<cmd>wincmd h<cr>')
vim.keymap.set('n', '<M-j>', '<cmd>wincmd j<cr>')
vim.keymap.set('n', '<M-k>', '<cmd>wincmd k<cr>')
vim.keymap.set('n', '<M-l>', '<cmd>wincmd l<cr>')

vim.keymap.set('n', '<M-H>', '<cmd>vertical :res -10<cr>')
vim.keymap.set('n', '<M-L>', '<cmd>vertical :res +10<cr>')
vim.keymap.set('n', '<M-J>', '<cmd>:res -10<cr>')
vim.keymap.set('n', '<M-K>', '<cmd>:res +10<cr>')
vim.keymap.set('n', '<M-=>', '<cmd>wincmd =<cr>')
