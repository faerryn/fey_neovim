# Table of Contents
- [FEY](#fey)
  * [1. Well organized configs](#1-well-organized-configs)
  * [2. Lazy loading for performance](#2-lazy-loading-for-performance)
- [Requirements](#requirements)
- [Trying out](#trying-out)
- [Installing](#installing)
  * [Automatic install](#automatic-install)
  * [Manual install](#manual-install)
- [Configuring](#configuring)
- [Updating/Upgrading](#updating-upgrading)
- [FAQ and NOTICE Board](#faq-and-notice-board)

# FEY
Fey is a configuration framework of Neovim inspired by [Doom Emacs](https://github.com/hlissner/doom-emacs). It uses [minpac](https://github.com/k-takata/minpac) as a package manager. Fey has two goals:

## 1. Well organized configs
Fey uses the idea of `modules` from DOOM to organize packages and configs in a sane manner. A module looks like this:

`~/.config/fey/modules/ui/git`

where `ui` is the category and `git` is the module name.

`~/.config/fey/modules/ui/git/packages.lua` is the packages file, which FEY will run during `fey sync`. It usually contains minpac calls.

e.g. `minpac.add'tpope/vim-fugitive'`

## 2. Lazy loading for performance
I try my best to lazy load the plugins. Sometime it even works! It is mostly ad-hoc at this early point.

Many mappings and commands from plugins will call `packadd` on their first use.

# Requirements
POSIX-compliant shell

[Neovim nightly](https://github.com/neovim/neovim/releases/nightly)

[ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd) are nice to have, too

# Trying out

Clone the repo with:

`git clone https://github.com/faerryn/fey_neovim.git fey_neovim`

Enter the repo:

`cd fey_neovim`

Install the everything with:

`bin/fey install`

Finally, cross your fingers and `nvim -u init.vim`.

If you wander off to another directory, and want to try out FEY:
`nvim -u /path/to/fey/repo/init.vim`

You can use [chvim](https://github.com/faerryn/chvim)!

# Installing

## Automatic install
`curl https://raw.githubusercontent.com/faerryn/fey_neovim/master/install.sh | sh`

Your old config will be in `~/.config/nvim.backup`

## Manual install
Clone the repo with:

`git clone https://github.com/faerryn/fey_neovim.git $HOME/.config/nvim`

Install the everything with:

`$HOME/.config/nvim/bin/fey install`

Consider adding `$HOME/.config/nvim/bin` to your PATH, so you have access to `fey`.

Finally, cross your fingers and `nvim`.

# Configuring
Your configurations should be in `~/.config/fey`

`init.lua` returns a list of modules to be enabled.
`config.lua` will be run on startup, so you can put your code there.

`modules/category/module_name` will contain modules to be enabled in `init.lua`

Each module may contain `packages.lua` and `config.lua`.

`packages.lua` is run during `fey sync`. Use it to install plugins with minpac.

`config.lua` is run during normal use. Use it to lazy-load your plugins and configure them.

# Updating/Upgrading
To upgrade to the latest FEY:
`fey upgrade`

To just update the plugins without upgrading FEY:
`fey sync`

# FAQ and NOTICE Board
## Help! I removed FEY but I still have some FEY plugins loaded
`rm -rf ~/.local/share/nvim/site/pack/minpac`
This issue should no longer exist as of f5950d7035, Sep 28 2020
