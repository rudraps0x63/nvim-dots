local first_time = true
local mode_names = {
  n = "N", no = "N?", nov = "N?", noV = "N?", ["no\22"] = "N?", niI = "Ni", niR = "Nr", niV = "Nv", nt = "Nt",
  v = "V", vs = "Vs", V = "V_", Vs = "Vs", ["\22"] = "^V", ["\22s"] = "^V",
  s = "S", S = "S_", ["\19"] = "^S",
  i = "I", ic = "Ic", ix = "Ix",
  R = "R", Rc = "Rc", Rx = "Rx", Rv = "Rv", Rvc = "Rv", Rvx = "Rv",
  c = "C", cv = "Ex",
  r = "...", rm = "M",
  ["r?"] = "?", ["!"] = "!", t = "T",
}

local normal_fg_clr = '#b47ede'
local cmd_fg_clr = '#c48282'
local ins_fg_clr = '#94ffb2'
local mode_colors = {
  n = normal_fg_clr,
  i = ins_fg_clr, v = "cyan", V =  "cyan",
  ["\22"] =  "cyan",
  c =  cmd_fg_clr,
  s =  "purple",
  S =  "purple",
  ["\19"] =  "purple",
  R =  cmd_fg_clr,
  r =  cmd_fg_clr,
  ["!"] =  "red",
  t =  "red",
}

local lualine_setup = function()
  local theme = require('lualine.themes.vague')
  local fg_clr = normal_fg_clr
  -- local bg_clr = '#0d0d1c'
  -- local fg_clr = 'none'
  local bg_clr = 'none'

  local lualine_a_icons = {
    n = '🌊',
    i = '🤓',
    c =  '😈',
  }

  -- for _, obj in pairs(theme) do
  --   obj.a.fg = fg_clr; obj.a.bg = bg_clr
  --   obj.b.fg = fg_clr; obj.b.bg = bg_clr
  --   if obj.c ~= nil then
  --     obj.c.fg = fg_clr; obj.c.bg = bg_clr
  --   end
  -- end

  require('lualine').setup({
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      theme = theme
    },
    icons_enabled = true,
    sections = {
      lualine_a = {
        {
          'mode',
          fmt = function(mode, ctx)
            -- if first_time then
            --   print(vim.inspect(ctx))
            --   first_time = false
            -- end
            local emoji = lualine_a_icons[vim.fn.mode()] or lualine_a_icons.n
            return emoji .. ' ✦ ' .. string.lower(string.sub(mode, 1, 3))
          end,
          -- color = function()
          --   return { fg = mode_colors[vim.fn.mode()] }
          -- end
        }
      },
      lualine_b = {
        {
          'branch',
          color = function()
            return { fg = '#20b2aa' }
          end
        },
        {
          'diff'
        },
      },
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
          symbols = { readonly = '[RDONLY]' },
          fmt = function(fname, _)
            return fname .. ' ✦'
          end
        },
      },
      lualine_x = {},
      lualine_y = { 'location' },
      lualine_z = {}
    }
  })
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = lualine_setup
}

