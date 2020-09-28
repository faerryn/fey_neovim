-- Leader key
vim.g.mapleader       = ' '

-- Line numbers
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'number'

-- Spelling
vim.o.spell           = true
vim.wo.spell          = true
vim.o.spellcapcheck   = ''
vim.bo.spellcapcheck  = ''

-- UI
vim.o.laststatus      = 2
vim.o.showcmd         = false
vim.o.showmode        = false
vim.o.showtabline     = 2

-- Splits
vim.o.equalalways     = false
vim.o.splitbelow      = true
vim.o.splitright      = true

-- Wrapping
vim.wo.linebreak      = true
vim.wo.wrap           = true

-- Misc setting
vim.o.confirm         = true
vim.o.foldlevelstart  = 99
vim.o.inccommand      = 'nosplit'
vim.o.iskeyword       = 'a-z,A-Z,48-57,_,-'
vim.bo.iskeyword      = 'a-z,A-Z,48-57,_,-'
vim.o.lazyredraw      = true
vim.o.nrformats       = 'alpha,octal,hex,bin'
vim.bo.nrformats      = 'alpha,octal,hex,bin'
vim.o.omnifunc        = 'syntaxcomplete#Complete'
vim.bo.omnifunc       = 'syntaxcomplete#Complete'

-- ripgrep
if vim.fn.executable'rg' then
	vim.o.grepprg    = '{2>/dev/null rg --hidden --threads=1 --ignore-file $XDG_CONFIG_HOME/rg/ignore --vimgrep $*}'
	vim.o.grepformat = '%f:%l:%c:%m'
end

-- Yank highlighting
vim.cmd'autocmd TextYankPost * lua vim.highlight.on_yank{timeout=500}'

-- Remember last cursor position
vim.cmd'autocmd BufReadPost * lua if vim.bo.filetype ~= "gitcommit" then pcall(vim.api.nvim_win_set_cursor, 0, vim.api.nvim_buf_get_mark(0, "\\"")) end'

-- api
function fey_core_set_colorscheme(colorscheme, background)
	vim.o.background = background
	vim.cmd('colorscheme ' .. colorscheme)
	vim.cmd'doautocmd ColorScheme'
end
