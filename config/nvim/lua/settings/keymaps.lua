vim.g.mapleader = ' '

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Press enter again to clear search highlights
vim.keymap.set('n', '<cr>', '<cmd>noh<cr><cr>')

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
vim.api.nvim_exec([[
  augroup QuickfixListNav
    autocmd!
    autocmd FileType qf nnoremap <buffer> j :cnext<CR>
    autocmd FileType qf nnoremap <buffer> k :cprev<CR>
  augroup END
]], false)

-- Location list navigation
vim.api.nvim_exec([[
  augroup LocationListNav
    autocmd!
    autocmd FileType * if !empty(getloclist(0)) | echo "Triggered" | nnoremap <buffer> j :lnext<CR>:lopen<CR> | nnoremap <buffer> k :lprev<CR>:lopen<CR> | endif
  augroup END
]], false)

