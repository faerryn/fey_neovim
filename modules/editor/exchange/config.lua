vim.g.exchange_no_mappings = 1
function fey_editor_exchange()
	vim.cmd'packadd vim-exchange'
	vim.cmd'nmap gx <Plug>(Exchange)'
	vim.cmd'xmap gx <Plug>(Exchange)'
	vim.cmd'nmap gx_ <Plug>(ExchangeClear)'
	vim.cmd'nmap gxx <Plug>(ExchangeLine)'
end
vim.cmd'nmap gx <Cmd>lua fey_editor_exchange()<CR>gx'
vim.cmd'xmap gx <Cmd>lua fey_editor_exchange()<CR>gx'
vim.cmd'nmap gx_ <Cmd>lua fey_editor_exchange()<CR>gx'
vim.cmd'nmap gxx <Cmd>lua fey_editor_exchange()<CR>gxx'
