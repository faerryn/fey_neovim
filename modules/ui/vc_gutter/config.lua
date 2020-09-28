vim.cmd"autocmd User SignifyAutocmds exe 'au! signify' | au signify BufWritePost * call sy#start()"
vim.cmd"autocmd fey_ui_vc_gutter BufEnter * SignifyRefresh"
