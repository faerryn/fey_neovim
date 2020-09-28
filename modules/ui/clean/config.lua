vim.cmd'nnoremap <silent> <leader><leader> <cmd>Goyo<CR>'
vim.cmd'autocmd! User GoyoEnter setglobal scrolloff=999 | Limelight'
vim.cmd'autocmd! User GoyoLeave setglobal scrolloff=0   | Limelight!'

vim.cmd'command! -nargs=? -bar -bang Goyo packadd goyo.vim | call goyo#execute(<bang>0, <q-args>)'
vim.cmd'command! -nargs=? -bar -bang -range Limelight packadd limelight.vim | call limelight#execute(<bang>0, <count> > 0, <line1>, <line2>, <f-args>)'
