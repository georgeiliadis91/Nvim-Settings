-- NOTE: colorbuddy on `main` (>= 8b96858) dropped the `pcall(require, name)`
-- at the end of `colorscheme()`, so it only sets g:colors_name / termguicolors
-- and never loads the theme module. cobalt2's `colors/cobalt2.vim` is an empty
-- stub, so `:colorscheme cobalt2` doesn't help either. Load the module here.
local function load_cobalt2()
  require('colorbuddy').colorscheme('cobalt2')

  -- Idempotent re-load: drop the cached module so the highlight groups are
  -- re-declared when the theme is applied more than once.
  package.loaded['cobalt2'] = nil
  require('cobalt2')
end

load_cobalt2()

function ThemeUpdate(color)
  color = color or "cobalt2"
  if color == "cobalt2" then
    load_cobalt2()
  else
    vim.cmd.colorscheme(color)
  end
end
