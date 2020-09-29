vim.cmd"autocmd User SignifyAutocmds exe 'au! signify' | au signify BufWritePost * call sy#start()"
vim.cmd"autocmd BufEnter * SignifyRefresh"
vim.cmd'packadd vim-signify'
