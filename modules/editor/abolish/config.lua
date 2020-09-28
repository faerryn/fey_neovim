vim.cmd'nmap cr <Cmd>packadd vim-abolish<CR>cr'
vim.cmd'command! -nargs=+ -bang -bar -range=0 Abolish packadd vim-abolish <Bar> <line1>,<line2>Abolish<bang> <args>'
vim.cmd'command! -nargs=1 -bang -bar -range=0 Subvert packadd vim-abolish <Bar> <line1>,<line2>Subvert<bang> <args>'
vim.cmd'command -nargs=1 -bang -bar -range=0 S <line1>,<line2>Subvert<bang> <args>'
