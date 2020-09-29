local source = nil
if vim.fn.executable'fd' then
	source = 'fd --hidden --type=f --type=d'
end
fey.tools_fzf.files = function()
	if vim.g.loaded_fzf == nil then vim.cmd'packadd fzf' end
	vim.fn['fzf#run']{sink = 'edit', source = source, window = 'new'}
end
vim.cmd"nnoremap <silent> <Leader>f <Cmd>lua fey.tools_fzf.files()<CR>"
vim.cmd"autocmd FileType fzf tnoremap <silent> <buffer> <Esc> <C-C>"
