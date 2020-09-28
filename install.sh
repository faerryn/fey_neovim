#!/bin/sh
CONFIG_NVIM_D="${XDG_CONFIG_HOME:-$HOME}/.config/nvim"
if [ -d "$CONFIG_NVIM_D" ]; then
	if [ -f "$CONFIG_NVIM_D.backup" ]; then
		echo "backup directory $CONFIG_NVIM_D.backup already in use!"
		return 1
	fi
	mv "$CONFIG_NVIM_D" "$CONFIG_NVIM_D.backup"
fi
git clone --depth 1 https://github.com/faerryn/fey_neovim.git "$CONFIG_NVIM_D"
"$CONFIG_NVIM_D/bin/fey" install
