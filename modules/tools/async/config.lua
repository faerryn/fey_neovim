vim.cmd'command! -bang -nargs=* AsyncRun packadd asyncrun.vim | AsyncRun<bang> <args>'
vim.cmd"command! -bang -nargs=* Make AsyncRun<bang> -strip -post=copen -program=make <args>"
