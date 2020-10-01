local setup_vim_eunuch = 'delcommand SudoWrite <Bar> packadd vim-eunuch'
vim.cmd('command! -bar -bang Unlink ' .. setup_vim_eunuch .. ' <Bar> Unlink<bang>')
vim.cmd'command! -bar -bang Remove Unlink<bang>'
vim.cmd('command! -bar -bang Delete ' .. setup_vim_eunuch .. ' <Bar> Delete<bang>')
vim.cmd('command! -bar -nargs=1 -bang -complete=file Move ' .. setup_vim_eunuch .. ' <Bar> Move<bang> <args>')
vim.cmd('command! -bar -nargs=1 -bang -complete=file Rename ' .. setup_vim_eunuch .. ' <Bar> Rename<bang> <args>')
vim.cmd('command! -bar -bang -nargs=+ Chmod ' .. setup_vim_eunuch .. ' <Bar> Chmod<bang> <args>')
vim.cmd('command! -bar -bang -nargs=? -complete=dir Mkdir ' .. setup_vim_eunuch .. ' <Bar> Mkdir<bang> <args>')
vim.cmd('command! -bar -bang -complete=file -nargs=+ Cfind   ' .. setup_vim_eunuch .. ' <Bar> Cfind<bang> <args>')
vim.cmd('command! -bar -bang -complete=file -nargs=+ Clocate ' .. setup_vim_eunuch .. ' <Bar> Clocate<bang> <args>')
vim.cmd('command! -bar -bang -complete=file -nargs=+ Lfind   ' .. setup_vim_eunuch .. ' <Bar> Lfind<bang> <args>')
vim.cmd('command! -bar -bang -complete=file -nargs=+ Llocate ' .. setup_vim_eunuch .. ' <Bar> Llocate<bang> <args>')
vim.cmd('command! -bar -bang -complete=file -nargs=? SudoEdit ' .. setup_vim_eunuch .. ' <Bar> SudoEdit<bang> <args>')
vim.cmd('command! -bar SudoWrite ' .. setup_vim_eunuch .. ' <Bar> SudoEdit')
vim.cmd('command! -bar -nargs=? Wall ' .. setup_vim_eunuch .. ' <Bar> Wall <args>')
vim.cmd'command! -bar W Wall'
