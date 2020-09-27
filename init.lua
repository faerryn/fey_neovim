if vim.g.batch ~= nil then
	vim.cmd'packadd minpac'

	minpac = {
		init = vim.fn['minpac#init'],
		add = vim.fn['minpac#add'],
		update = vim.fn['minpac#update'],
		clean = vim.fn['minpac#clean'],
		getplugininfo = vim.fn['minpac#getplugininfo'],
		getpluginlist = vim.fn['minpac#getpluginlist'],
		getpackages = vim.fn['minpac#getpackages'],
		status = vim.fn['minpac#status'],
	}

	minpac.init{ dir = vim.fn.stdpath'data' .. '/site', confirm = false }
	minpac.add('k-takata/minpac', {type = 'opt'})
end

local function load_module(module_d, module_name)
	if vim.g.batch ~= nil then
		local packages_f = module_d .. '/packages.lua'
		if vim.fn.filereadable(packages_f) ~= 0 then dofile(packages_f) end
	else
		local augroup = 'fey_' .. module_name:gsub('/', '_')
		vim.cmd('augroup ' .. augroup)
		vim.cmd('autocmd! ' .. augroup)
		vim.cmd('augroup END')
		local config_f = module_d .. '/config.lua'
		if vim.fn.filereadable(config_f) ~= 0 then dofile(config_f) end
	end
end

local config_d = vim.fn.expand'$XDG_CONFIG_HOME'
if config_d == '' then config_d = vim.fn.expand'$HOME/.config' end
local fey_d = config_d .. '/fey'

load_module(vim.fn.stdpath'config', 'core')
load_module(fey_d, 'user')

local init_f = fey_d .. '/init.lua'
local modules_d = vim.fn.stdpath'config' .. '/modules'
local user_modules_d = fey_d .. '/modules'

for category, modules in pairs(dofile(init_f)) do
	for _, module in ipairs(modules) do
		local category_module_d = category .. '/' .. module
		local user_category_module_d = user_modules_d .. '/' .. category_module_d
		if vim.fn.isdirectory(user_category_module_d) ~= 0 then
			load_module(user_category_module_d, category_module_d)
		else
			load_module(modules_d .. '/' .. category_module_d, category_module_d)
		end
	end
end
