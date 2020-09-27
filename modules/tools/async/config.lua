vim.cmd'command! AsyncRun packadd asyncrun.vim | AsyncRun <args>'
vim.cmd"command! -nargs=* Make AsyncRun -strip -post=copen -program=make <args>"
