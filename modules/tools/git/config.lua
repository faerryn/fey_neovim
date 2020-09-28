vim.cmd'command! -bang -nargs=? -range=-1 -complete=customlist,fugitive#Complete G packadd vim-fugitive <Bar> call FugitiveDetect(expand("%")) <Bar> exe fugitive#Command(<line1>, <count>, +"<range>", <bang>0, "<mods>", <q-args>)'
vim.cmd'nnoremap <silent> <Leader>g <cmd>belowright G<CR>'
