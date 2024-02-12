# Personal Nvim Setup

## Prerequisites

Make sure you have packer installed from here:
[Packer Install Here](https://github.com/wbthomason/packer.nvim#quickstart)

Required v0.9+ of neovim.

Make sure you have installed 

```
ripgrep, fg
```
Available via most package managers

Clone files into ~/.config/nvim

Rename the geo dir as you please and make sure to update the path of the init files.
On the main packer.lua file run
```
:so
```
and 

```
:PackerSync 
```

if encountered with any treesitter errors run 

```
:TSUpdate
```


to download the plugins

Use :Mason to toggle and install lsp's from list

Includes github's copilot setup for nvim

Check the after/plugins/{plugin_name.lua} file for relevant keymaps

 @todo: add list of plugins used
