local source = nil
if vim.fn.executable'fd' then
	source = 'fd --hidden --type=f --type=d'
end
function fey_tools_fzf_files()
	if vim.g.loaded_fzf == nil then vim.cmd'packadd fzf' end
	vim.fn['fzf#run']{sink = 'edit', source = source, window = 'new'}
end
vim.cmd"nnoremap <silent> <Leader>f <Cmd>lua fey_tools_fzf_files()<CR>"
vim.cmd"autocmd fey_tools_fzf FileType fzf tnoremap <silent> <buffer> <Esc> <C-C>"
