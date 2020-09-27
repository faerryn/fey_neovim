local plug = vim.fn.eval'"\\<Plug>"'
vim.g['sandwich#recipes'] = {
	{ buns = {'(', ')'}, nesting = -1, linewise = 0, input = {'(', ')', 'b'} },
	{ buns = {'{', '}'}, nesting = -1, linewise = 0, input = {'{', '}', 'B'} },
	{ buns = {'[', ']'}, nesting = -1, linewise = 0, input = {'[', ']'} },
	{ buns = {'<', '>'}, nesting = -1, linewise = 0, input = {'<', '>'} },
      	{ buns = 'sandwich#magicchar#t#tag()', listexpr = 1, kind = {'add'}, action = {'add'}, input = {'t'} },
      	{ buns = 'sandwich#magicchar#t#tag()', listexpr = 1, kind = {'replace'}, action = {'add'}, input = {'t'} },
	{ external = {plug .. '(textobj-sandwich-tag-i)', plug .. '(textobj-sandwich-tag-a)'}, noremap = 0, kind = {'replace', 'query'}, expr_filter = {'operator#sandwich#kind() ==# "replace"'}, synchro = 1, input = {'t'} },
	{ external = {plug .. '(textobj-sandwich-tag-i)', plug .. "(textobj-sandwich-tag-a)"}, noremap = 0, kind = {'delete', 'textobj'}, expr_filter = {'operator#sandwich#kind() !=# "replace"'}, synchro = 1, linewise = 1, input = {'t'} },
}

vim.g.sandwich_no_default_key_mappings          = 1
vim.g.operator_sandwich_no_default_key_mappings = 1
vim.g.textobj_sandwich_no_default_key_mappings  = 1

vim.cmd'map <silent> sa <Plug>(operator-sandwich-add)'
vim.cmd'nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)'
vim.cmd'nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)'
