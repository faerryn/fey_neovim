# FEY
Fey is a distribution of Neovim inspired by [Doom Emacs](https://github.com/hlissner/doom-emacs). It uses [minpac](https://github.com/k-takata/minpac) as a package manager. Fey has two goals:

## 1. Well organized configs
Fey uses the idea of `modules` to organize packages and configs in a sane manner. A module looks like this:

`~/.config/fey/modules/ui/git`

where `ui` is the category and `git` is the module name.

`~/.config/fey/modules/ui/git/packages.lua` is the packages file, which FEY will run during `fey sync`. It usually contains minpac calls.

e.g. `minpac.add'tpope/vim-fugitive'`

## 2. Lazy loading for performance
I try my best to lazy load the plugins. Sometime it even works! It is mostly ad-hoc at this early point.

# Trying out

Clone the repo with:

`git clone https://github.com/faerryn/fey_neovim.git fey`

Enter the repo:

`cd fey`

Install the everything with:

`bin/fey install`

Finally, cross your fingers and `nvim -u init.vim`.

If you wander off to another directory, and want to try out FEY:
`nvim -u /path/to/fey/repo/init.vim`

# Installing
**WARNING! THIS WILL DELETE YOUR OLD CONFIG**

Clone the repo with:

`git clone https://github.com/faerryn/fey_neovim.git $HOME/.config/nvim`

Install the everything with:

`$HOME/.config/nvim/bin/fey install`

Finally, cross your fingers and `nvim`.
