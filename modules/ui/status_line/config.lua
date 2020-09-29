fey.ui_status_line.lightline = function()
	if vim.g.loaded_lightline == nil then
		vim.cmd'packadd lightline.vim'
	end
	vim.g.lightline = { tabline = { right = {} }, colorscheme = vim.g.colors_name or 'default' }
	vim.fn['lightline#enable']()
end
vim.cmd'autocmd VimEnter,ColorScheme * lua fey.ui_status_line.lightline()'
