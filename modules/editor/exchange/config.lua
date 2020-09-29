vim.g.exchange_no_mappings = 1
fey.editor_exchange.exchange = function()
	fey.editor_exchange.exchange = nil
	vim.cmd'packadd vim-exchange'
	vim.cmd'nmap gx <Plug>(Exchange)'
	vim.cmd'xmap gx <Plug>(Exchange)'
	vim.cmd'nmap gx_ <Plug>(ExchangeClear)'
	vim.cmd'nmap gxx <Plug>(ExchangeLine)'
end
vim.cmd'nmap gx <Cmd>lua fey.editor_exchange.exchange()<CR>gx'
vim.cmd'xmap gx <Cmd>lua fey.editor_exchange.exchange()<CR>gx'
vim.cmd'nmap gx_ <Cmd>lua fey.editor_exchange.exchange()<CR>gx'
vim.cmd'nmap gxx <Cmd>lua fey.editor_exchange.exchange()<CR>gxx'
