vim.g.gruvbox_bold      = 1
vim.g.gruvbox_italic    = 1
vim.g.gruvbox_underline = 1
vim.g.gruvbox_undercurl = 1

function fey_ui_colorscheme(colorscheme, background)
	vim.o.background = background
	vim.cmd('colorscheme ' .. colorscheme)
	vim.cmd'doautocmd ColorScheme'
end
