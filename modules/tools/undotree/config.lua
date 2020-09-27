vim.g.undotree_CustomUndotreeCmd  = 'new'
vim.g.undotree_CustomDiffpanelCmd = '"'
vim.g.undotree_HelpLine           = 0

function personal_undotree()
	vim.cmd'UndotreeShow'
	vim.cmd'UndotreeFocus'
	vim.bo.filetype = 'undotree'
end
vim.cmd'nnoremap <silent> <Leader>u <cmd>lua personal_undotree()<CR>'
vim.cmd'autocmd FileType undotree nnoremap <silent> <buffer> <C-W>c <cmd>UndotreeHide<CR>'
