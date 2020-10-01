-- Disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- load up vim-dirvish
vim.cmd'autocmd BufEnter * if isdirectory(expand("%")) | packadd vim-dirvish | set filetype=dirvish | autocmd! fey_tools_filesystem'
