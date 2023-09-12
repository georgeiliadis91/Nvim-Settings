# Personal Nvim Setup

## Prerequisites

Make sure you have packer installed from here:
[Packer Install Here](https://github.com/wbthomason/packer.nvim#quickstart)

Make sure you have installed 

```
rigprep, fg
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
to download the plugins

Note run 
```
:lua ThemeUpdate()
```
after each 
```
:PackerSync
```

to make sure your theme is not broken

Use :Mason to toggle and install lsp's from list

Check the after/plugins/{plugin_name.lua} file for relevant keymaps

 @todo: add list of plugins used
