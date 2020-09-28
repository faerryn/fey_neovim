function fey_ui_status_line_lightline()
	vim.g.lightline = { tabline = { right = {} }, colorscheme = vim.g.colors_name or 'default' }
	pcall(vim.fn['lightline#enable'])
end
vim.cmd'autocmd fey_ui_status_line VimEnter,ColorScheme * lua fey_ui_status_line_lightline()'
