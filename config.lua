vim.g.mapleader       = ' '

vim.o.hidden          = true
vim.o.clipboard       = 'unnamedplus'
vim.o.confirm         = true
vim.o.foldlevelstart  = 99
vim.o.inccommand      = 'nosplit'
vim.o.iskeyword       = 'a-z,A-Z,48-57,_,-'
vim.bo.iskeyword      = 'a-z,A-Z,48-57,_,-'
vim.o.lazyredraw      = true
vim.o.mouse           = 'ar'
vim.o.nrformats       = 'alpha,octal,hex,bin'
vim.bo.nrformats      = 'alpha,octal,hex,bin'
vim.o.omnifunc        = 'syntaxcomplete#Complete'
vim.bo.omnifunc       = 'syntaxcomplete#Complete'
vim.o.spell           = true
vim.wo.spell          = true
vim.o.spellcapcheck   = ''
vim.bo.spellcapcheck  = ''

vim.o.shadafile       = vim.fn.stdpath'cache' .. '/shada/main.shada'
vim.o.directory       = vim.fn.stdpath'cache' .. '/swap'
vim.o.undodir         = vim.fn.stdpath'cache' .. '/undo'
vim.o.undofile        = true
vim.bo.undofile       = true

vim.o.timeoutlen      = 500
vim.o.updatetime      = 500

vim.o.equalalways     = false
vim.o.laststatus      = 2
vim.wo.linebreak      = true
vim.wo.number         = true
vim.wo.relativenumber = true
vim.o.showcmd         = false
vim.o.showmode        = false
vim.o.showtabline     = 2
vim.wo.signcolumn     = 'number'
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.wo.wrap           = true

vim.o.termguicolors   = true
vim.cmd'doautocmd ColorScheme'

vim.cmd'autocmd FileType qf nnoremap <silent> <buffer> q <C-W>c'
vim.cmd'noremap <silent> <Leader> <Nop>'
vim.cmd'noremap <silent> s <Nop>'

vim.cmd'nnoremap Y y$'

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.executable'rg' then
	vim.o.grepprg    = '{2>/dev/null rg --hidden --threads=1 --ignore-file $XDG_CONFIG_HOME/rg/ignore --vimgrep $*}'
	vim.o.grepformat = '%f:%l:%c:%m'
end

vim.cmd'autocmd TextYankPost * lua vim.highlight.on_yank{timeout=500}'
vim.cmd'autocmd BufReadPost * lua pcall(vim.api.nvim_win_set_cursor, 0, vim.api.nvim_buf_get_mark(0, "\\""))'

function fey_core_set_colorscheme(colorscheme, background)
	vim.o.background = background
	vim.cmd('colorscheme ' .. colorscheme)
	vim.cmd'doautocmd ColorScheme'
end
