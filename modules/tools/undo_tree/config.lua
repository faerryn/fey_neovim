vim.g.undotree_CustomUndotreeCmd  = 'new'
vim.g.undotree_CustomDiffpanelCmd = '"'
vim.g.undotree_HelpLine           = 0

fey.tools_undo_tree.undo_tree = function()
	if vim.g.loaded_undotree == nil then
		vim.cmd'packadd undotree'
	end
	vim.fn['undotree#UndotreeShow']()
	vim.fn['undotree#UndotreeFocus']()
	vim.bo.filetype = 'undotree'
end
vim.cmd'nnoremap <silent> <Leader>u <cmd>lua fey.tools_undo_tree.undo_tree()<CR>'
vim.cmd'autocmd FileType undotree nnoremap <silent> <buffer> <C-W>c <cmd>UndotreeHide<CR>'
