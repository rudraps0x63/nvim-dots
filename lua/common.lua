local M = {}

M.setup = function()
  vim.g.mapleader = ','
  vim.g.loaded_netrw = 1

  vim.o.nu = true
  vim.o.rnu = true

  vim.o.tabstop = 4
  vim.o.shiftwidth = 4
  vim.o.expandtab = true

  vim.o.cursorline = true
  vim.o.termguicolors = true
  vim.o.winborder = 'rounded'

  vim.o.hlsearch = false
  vim.o.incsearch = true

  -- Split windows on right and below
  vim.o.splitright = true
  vim.o.splitbelow = true

  vim.o.swapfile = false

  vim.cmd.colorscheme('default')
  vim.api.nvim_set_hl(0, 'Normal', { bg = nil })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
  vim.api.nvim_set_hl(0, 'Structure', { bold = true })
  vim.api.nvim_set_hl(0, 'Function', { fg = '#ffffc5' })
  vim.api.nvim_set_hl(0, 'String', { italic = false })
  vim.api.nvim_set_hl(0, 'Constant', { italic = false })
  vim.api.nvim_set_hl(0, 'Boolean', { italic = false })
  vim.api.nvim_set_hl(0, '@lsp.type.macro', { italic = false })

  -- Autocommands
  -- Highlight yanked text for 200ms
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Buffer', { clear = true }),
    pattern = '*',
    callback = function()
      vim.highlight.on_yank({ timeout = 200 }) -- :h lua-highlight
    end
  })

  -- If file is .c or .cpp, tabs are equal to 2 spaces
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('Files', { clear = true }),
    pattern = { 'c', 'cpp', 'lua', 'cmake', 'javascript' },
    callback = function()
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
    end
  })

  -- Statusline
  local cmp = {} -- statusline components
  local hi_pattern = '%%#%s#%s%%*'

  function _G._statusline_component(name)
    return cmp[name]()
  end

  function cmp.diagnostic_status()
    local mode = vim.api.nvim_get_mode().mode
    local ignore = {
      ['c'] = true, -- command mode
      ['t'] = true  -- terminal mode
    }

    if ignore[mode] then
      return ''
    end

    local status = '   '
    local levels = vim.diagnostic.severity
    local errors = #vim.diagnostic.get(0, { severity = levels.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = levels.WARN })

    if errors > 0 then
      status = status .. errors .. 'E'
    end

    if warnings > 0 then
      if errors > 0 then
        status = status .. ','
      end
      status = status .. warnings .. 'W  '
    end

    return status
  end

  function cmp.position()
    return hi_pattern:format('Search',' %3l:%-2c ')
  end

  local statusline = {
    '%f',
    '%r',
    '%m',
    '%{%v:lua._statusline_component("diagnostic_status")%} ',
    '%=',
    '%{%v:lua._statusline_component("position")%}'
  }

  vim.o.statusline = table.concat(statusline, '')
end

return M

