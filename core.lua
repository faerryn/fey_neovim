-- core.lua
-- Essential settings for lots of goodies
vim.o.hidden          = true
vim.o.clipboard       = 'unnamedplus'
vim.o.mouse           = 'ar'

vim.o.timeoutlen      = 500
vim.o.updatetime      = 500

vim.o.termguicolors   = true

-- Y for y$ instead of yy
vim.cmd'nnoremap Y y$'

-- Persistent Files
vim.o.shadafile       = vim.fn.stdpath'cache' .. '/shada/main.shada'
vim.o.directory       = vim.fn.stdpath'cache' .. '/swap'
vim.o.undodir         = vim.fn.stdpath'cache' .. '/undo'
vim.o.undofile        = true
vim.bo.undofile       = true

-- q to quit quickfix and location list
vim.cmd'autocmd FileType qf nnoremap <silent> <buffer> q <C-W>c'

-- Disable s and S (equivalent to C and cc)
vim.cmd'noremap <silent> S <Nop>'
vim.cmd'noremap <silent> s <Nop>'

-- Disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
