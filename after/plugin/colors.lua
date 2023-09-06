-- Need to call this after every PackerSync execution
function ThemeUpdate(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

ThemeUpdate()
