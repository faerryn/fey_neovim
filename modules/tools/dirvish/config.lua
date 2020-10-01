-- Disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- load up vim-dirvish
vim.cmd'autocmd BufEnter * lua if vim.fn.isdirectory(vim.fn.expand("%")) ~= 0 then vim.cmd"autocmd! fey_tools_dirvish"; vim.cmd"packadd vim-dirvish"; vim.bo.filetype = "dirvish"; vim.cmd"Dirvish"; end'
