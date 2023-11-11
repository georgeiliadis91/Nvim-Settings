require("bluloco").setup({
  style = "dark",               -- "auto" | "dark" | "light"
  transparent = true,
  italics = false,
  terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
  guicursor   = true,
})

function ThemeUpdate(color)
 	color = color or "bluloco"
 	vim.cmd.colorscheme(color)
end

ThemeUpdate()
