-- Leader key
vim.g.mapleader       = ' '

-- Line numbers
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'number'

-- Persistent Files
vim.o.shadafile       = vim.fn.stdpath'cache' .. '/shada/main.shada'
vim.o.directory       = vim.fn.stdpath'cache' .. '/swap'
vim.o.undodir         = vim.fn.stdpath'cache' .. '/undo'
vim.o.undofile        = true
vim.bo.undofile       = true

if vim.fn.executable'rg' then
	vim.o.grepprg    = '{2>/dev/null rg --hidden --threads=1 --ignore-file $XDG_CONFIG_HOME/rg/ignore --vimgrep $*}'
	vim.o.grepformat = '%f:%l:%c:%m'
end

vim.cmd'autocmd TextYankPost * lua vim.highlight.on_yank{timeout=500}'
vim.cmd'autocmd BufReadPost * lua if vim.bo.filetype ~= "gitcommit" then pcall(vim.api.nvim_win_set_cursor, 0, vim.api.nvim_buf_get_mark(0, "\\"")) end'

function fey_core_set_colorscheme(colorscheme, background)
	vim.o.background = background
	vim.cmd('colorscheme ' .. colorscheme)
	vim.cmd'doautocmd ColorScheme'
end

-- Lazy loading
function fey_core_repeat()
	vim.cmd'packadd vim-repeat'
	vim.cmd'nmap . <Plug>(RepeatDot)'
	vim.cmd'nmap u <Plug>(RepeatUndo)'
	vim.cmd'nmap U <Plug>(RepeatUndoLine)'
	vim.cmd'nmap <C-R> <Plug>(RepeatRedo)'
end
vim.cmd'nmap .     <Cmd>lua fey_core_repeat()<CR>.'
vim.cmd'nmap u     <Cmd>lua fey_core_repeat()<CR>u'
vim.cmd'nmap U     <Cmd>lua fey_core_repeat()<CR>U'
vim.cmd'nmap <C-R> <Cmd>lua fey_core_repeat()<CR><C-R>'
