fey.ui_status_line.lightline = function()
	vim.g.lightline = { tabline = { right = {} }, colorscheme = vim.g.colors_name or 'default' }
	vim.fn['lightline#enable']()
end
vim.cmd'autocmd VimEnter,ColorScheme * lua fey.ui_status_line.lightline()'
vim.cmd'packadd lightline.vim'
