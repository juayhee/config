--General
vim.cmd('set timeout')
vim.cmd('set timeoutlen=500')
vim.cmd('set termguicolors')

-- Spaces and Tabs
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set smartindent')
vim.cmd('filetype plugin indent on')

-- Visual
vim.cmd('set number')
vim.cmd('set rnu')
vim.cmd('set showcmd')
vim.o.cursorline = true
vim.o.cursorlineopt = 'number' -- Only highlight the line number
vim.o.syntax = false

-- Search
vim.cmd('set incsearch')
vim.cmd('set ignorecase')
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- Splits
vim.o.splitright = true -- Always split to the right
vim.o.splitbelow = true -- Always split down

-- LSP
vim.diagnostic.config({ virtual_text = false })
