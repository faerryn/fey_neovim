if fey.lang_zsh.features.zinit ~= nil then
	vim.cmd'autocmd FileType zsh ++once packadd zinit-vim-syntax'
end
