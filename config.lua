-- Essential settings for lots of goodies
vim.o.hidden          = true
vim.o.clipboard       = 'unnamedplus'
vim.o.mouse           = 'ar'

vim.o.timeoutlen      = 500
vim.o.updatetime      = 500

vim.o.termguicolors   = true

-- Y for y$ instead of yy
vim.cmd'nnoremap Y y$'

-- Persistent Files
vim.o.shadafile       = vim.fn.stdpath'cache' .. '/shada/main.shada'
vim.o.directory       = vim.fn.stdpath'cache' .. '/swap'
vim.o.undodir         = vim.fn.stdpath'cache' .. '/undo'
vim.o.undofile        = true
vim.bo.undofile       = true

-- q to quit quickfix and location list
vim.cmd'autocmd FileType qf nnoremap <silent> <buffer> q <C-W>c'

-- Disable s and S (equivalent to C and cc)
vim.cmd'noremap <silent> S <Nop>'
vim.cmd'noremap <silent> s <Nop>'

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
vim.cmd'autocmd BufReadPost * lua pcall(vim.api.nvim_win_set_cursor, 0, vim.api.nvim_buf_get_mark(0, "\\""))'

-- Loading
vim.cmd'packadd FixCursorHold.nvim'

vim.cmd'packadd vim-symlink'
vim.cmd'packadd vim-bbye'
vim.cmd'packadd vim-mkdir'

vim.cmd'packadd vim-repeat'
vim.cmd'packadd vim-visualrepeat'

vim.cmd'packadd vim-wordmotion'

-- Lazy loading
vim.cmd'autocmd fey_core CmdlineEnter * ++once packadd readline.vim'
vim.cmd'autocmd fey_core FileType qf ++once packadd vim-qf'
