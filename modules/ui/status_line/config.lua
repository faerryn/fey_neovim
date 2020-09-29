function fey_ui_status_line_lightline()
	vim.g.lightline = { tabline = { right = {} }, colorscheme = vim.g.colors_name or 'default' }
	if vim.g.loaded_lightline ~= nil then
		vim.fn['lightline#enable']()
	end
end
vim.cmd'autocmd fey_ui_status_line VimEnter,ColorScheme * lua fey_ui_status_line_lightline()'
vim.cmd'packadd lightline.vim'
