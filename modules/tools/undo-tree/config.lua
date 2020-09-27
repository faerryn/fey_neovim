vim.g.undotree_CustomUndotreeCmd  = 'new'
vim.g.undotree_CustomDiffpanelCmd = '"'
vim.g.undotree_HelpLine           = 0

function fey_tools_undo-tree()
	vim.cmd'UndotreeShow'
	vim.cmd'UndotreeFocus'
	vim.bo.filetype = 'undotree'
end
vim.cmd'nnoremap <silent> <Leader>u <cmd>lua fey_tools_undo-tree()<CR>'
vim.cmd'autocmd fey_tools_undo-tree FileType undotree nnoremap <silent> <buffer> <C-W>c <cmd>UndotreeHide<CR>'
