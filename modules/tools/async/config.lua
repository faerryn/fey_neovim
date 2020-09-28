vim.cmd"command! -bang -nargs=+ -range=0 -complete=file AsyncRun packadd asyncrun.vim | call asyncrun#run('<bang>', '', <q-args>, <count>, <line1>, <line2>)"
vim.cmd"command! -bang -nargs=* Make AsyncRun<bang> -strip -post=copen -program=make <args>"
