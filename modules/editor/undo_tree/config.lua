vim.g.undotree_CustomUndotreeCmd  = 'new'
vim.g.undotree_CustomDiffpanelCmd = '"'
vim.g.undotree_HelpLine           = 0

vim.cmd'command! UndotreeShow packadd undotree | UndotreeShow <args>'

function fey_tools_undo_tree()
	vim.cmd'UndotreeShow'
	vim.cmd'UndotreeFocus'
	vim.bo.filetype = 'undotree'
end
vim.cmd'nnoremap <silent> <Leader>u <cmd>lua fey_tools_undo_tree()<CR>'
vim.cmd'autocmd fey_editor_undo_tree FileType undotree nnoremap <silent> <buffer> <C-W>c <cmd>UndotreeHide<CR>'
