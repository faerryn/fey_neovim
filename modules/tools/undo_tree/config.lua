vim.g.undotree_CustomUndotreeCmd  = 'new'
vim.g.undotree_CustomDiffpanelCmd = '"'
vim.g.undotree_HelpLine           = 0

function fey_tools_undo_tree()
	if vim.g.loaded_undotree == nil then
		vim.cmd'packadd undotree'
	end
	vim.fn['undotree#UndotreeShow']()
	vim.fn['undotree#UndotreeFocus']()
	vim.bo.filetype = 'undotree'
end
vim.cmd'nnoremap <silent> <Leader>u <cmd>lua fey_tools_undo_tree()<CR>'
vim.cmd'autocmd fey_tools_undo_tree FileType undotree nnoremap <silent> <buffer> <C-W>c <cmd>UndotreeHide<CR>'
