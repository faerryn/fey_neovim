-- the installation path of FEY
fey_core_d = vim.fn.expand'<sfile>:p:h'

-- ~/.config or wherever the user has config files
local config_d = vim.fn.expand'$XDG_CONFIG_HOME'
if config_d == '' then
	config_d = vim.fn.expand'$HOME/.config'
end

-- ~/.local/share or wherever the user has data files
local data_d = vim.fn.expand'$XDG_DATA_HOME'
if data_d == '' then
	data_d = vim.fn.expand'$HOME/.local/share'
end

-- since we only want FEY minpac stuff to load for FEY, a new packpath
vim.o.packpath = data_d .. '/fey,' .. vim.o.packpath

-- if g:fey_load_packages == true or not 0
local fey_load_packages = vim.g.fey_load_packages == true or (type(vim.g.fey_load_packages) == 'number' and vim.g.fey_load_packages ~= 0)
-- if g:fey_load_config == true or not 0, assume true if nil
local fey_load_config = vim.g.fey_load_config == nil or vim.g.fey_load_config == true or (type(vim.g.fey_load_config) == 'number' and vim.g.fey_load_config ~= 0)

-- setup minpac
if fey_load_packages then
	-- put minpac into rtp
	vim.cmd'packadd minpac'

	-- wrapper for minpac
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

	-- load minpac
	minpac.init{ confirm = false }
	minpac.add('k-takata/minpac', {type = 'opt'})
end

-- dofile, but does nothing if the file doesn't exists, and prints a friendly
-- error (without crashing) if the file throws and error
local function load_file_lenient(file)
	if vim.fn.filereadable(file) == 0 then return end
	local status, result = pcall(dofile, file)
	if not status then
		print(result)
		return nil
	end
	return result
end

-- fey will contain 'public' global values and functions
if fey == nil then fey = {} end

-- fey.load_module loads a module. I guess you can't have a module in
-- /modules/load/module!
fey.load_module = function(module_d, name, features)
	-- populate fey[name] with features
	if fey[name] == nil then fey[name] = {} end
	fey[name].features = features

	if fey_load_packages then
		-- load packages.lua
		load_file_lenient(module_d .. '/packages.lua')
	end
	if fey_load_config then
		-- load config.lua, with an augroup setup for the file's own
		-- use and for us to put an autoreload autocmd
		local config_f = module_d .. '/config.lua'

		local augroup = 'fey_' .. name
		vim.cmd('augroup ' .. augroup)
		vim.cmd('autocmd! ' .. augroup)
		vim.cmd('autocmd! BufWritePost ' .. vim.fn.resolve(config_f) .. " lua fey.load_module('" .. module_d .. "', '" .. name .. "')")

		load_file_lenient(config_f)

		vim.cmd('augroup END')
	end
end


-- loads ~/.config/nvim, or wherever FEY is installed. Runs the /packages.lua
-- and /config.lua
fey.load_module(fey_core_d, 'core')

-- loads ~/.config/fey, or similar. Runs the user's /packages.lua
-- and the user's /config.lua
fey_user_d = config_d .. '/fey'
if vim.fn.isdirectory(fey_user_d) == 0 then
	fey_user_d = fey_core_d .. '/skel'
end
fey.load_module(fey_user_d, 'user')

-- the user's init.lua contains a list of modules to activate
local init_f = fey_user_d .. '/init.lua'
local core_module_d = fey_core_d .. '/modules'
local user_modules_d = fey_user_d .. '/modules'

-- /modules is split into categories
for category, modules in pairs(load_file_lenient(init_f) or {}) do
	-- that contain modules
	for key, value in pairs(modules) do
		-- sometimes the module's name is a string in list, sometimes
		-- an index value
		local module = type(key) == 'string' and key or value
		-- sometimes the modules have sub-features, if the key is a
		-- number, set the value as the key (for convenience)
		local features = type(value) == 'table' and value or {}
		for key, value in pairs(features) do
			if type(key) == 'number' then
				features[value] = key
			end
		end

		-- load up the module from ~/.config/fey/modules if possible,
		-- otherwise ~/.config/nvim/modules
		local module_d = user_modules_d .. '/' .. category .. '/' .. module
		if vim.fn.isdirectory(module_d) == 0 then
			module_d = core_module_d .. '/' .. category .. '/' .. module
		end
		fey.load_module(module_d, category .. '_' .. module, features)
	end
end
