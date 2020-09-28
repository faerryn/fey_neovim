-- basic settings
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

vim.o.timeoutlen      = 500
vim.o.updatetime      = 500

vim.o.equalalways     = false
vim.o.laststatus      = 2
vim.wo.linebreak      = true
vim.o.showcmd         = false
vim.o.showmode        = false
vim.o.showtabline     = 2
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
