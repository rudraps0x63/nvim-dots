local lualine_setup = function()
  local vague = require('lualine.themes.vague')

  vague.normal.a.fg = '#c3c3d5'
  vague.normal.a.bg = 'none'
  vague.normal.b.bg = 'none'
  vague.normal.c.bg = 'none'

  require('lualine').setup({
    icons_enabled = true,
    options = {
      section_separators = { left = ' ', right = ' ' },
      component_separators = { left = ' ', right = ' ' },
      theme = vague
    },
    sections = {
      lualine_y = { 'location' },
      lualine_z = { 'progress' }
    }
  })
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = lualine_setup
  -- 'tamton-aquib/staline.nvim',
  -- lazy = false,
  -- config = function()
  --   require ('staline').setup({
  --     sections = {
  --       left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
  --       mid = {},
  --       right = {'file_name', 'line_column' }
  --     },
  --     mode_colors = {
  --       i = "#d4be98",
  --       n = "#84a598",
  --       c = "#8fbf7f",
  --       v = "#fc802d",
  --     },
  --     defaults = {
  --       true_colors = true,
  --       line_column = " [%l/%L] :%c  ",
  --       branch_symbol = " "
  --     }
  --   })
  -- end
}

