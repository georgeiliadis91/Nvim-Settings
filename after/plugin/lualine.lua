require('lualine').setup {
  options = {
    theme = 'nordic',
    transparent = true,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, -- Use 1 to show relative path
      },
    },
  },
}

-- Function to get the relative path
local function get_relative_path()
  local current_file = vim.fn.expand('%:p')
  local project_root = vim.fn.finddir('your_project_root', '.;')
  local relative_path = vim.fn.fnamemodify(current_file, ':~:.')
  return vim.fn.pathshorten(vim.fn.fnamemodify(relative_path, ':~:' .. project_root))
end
