local M = {}
local Util = require('util.util')

local require_or_nil = function(mod)
  local ok, module = pcall(require, mod)

  if ok then
    return module
  end

  return nil
end

M.setup = function()
  local nt_api = require_or_nil('nvim-tree.api')
  local builtin = require_or_nil('fzf-lua')
  local carbon = require_or_nil('carbon')
  local get_node_under_cursor = function() -- Empty function in case NvimTree is not present
    return nil
  end

  -- Carbon
  if carbon then
    Util.set_mapping('n', '<Leader>tt', function()
      -- if Util.GLOBAL_CARBON_EXPLORER_FIRST_TIME then
      --   require('carbon.view').close_sidebar()
      --   Util.GLOBAL_CARBON_EXPLORER_OPEN = false
      -- else
      --   carbon.explore_sidebar()
      --   Util.GLOBAL_CARBON_EXPLORER_OPEN = true
      -- end

      carbon.toggle_sidebar()
    end, { desc = 'Toggle file tree' })
  end

  -- NvimTree
  if nt_api then
    Util.set_mapping('n', '<Leader>tt', nt_api.tree.toggle, { desc = 'Toggle file tree' })
    Util.set_mapping('n', '<Leader>T', nt_api.tree.open, { desc = 'Focus file tree, open if not' })

    get_node_under_cursor = nt_api.tree.get_node_under_cursor
  end

  -- Picker (FzfLua)
  if builtin then
    local apply_func_dir_under_cursor = function(builtin_func)
      local cursor_dir = get_node_under_cursor()

      if cursor_dir ~= nil and cursor_dir['type'] == 'directory' then
        builtin_func({ cwd = cursor_dir['absolute_path'] })
      else
        vim.notify('Node under cursor in file tree not valid, defaulting...', vim.log.levels.INFO)
        builtin_func()
      end
    end

    Util.set_mapping('n', '<Leader>ff', builtin.files, { desc = 'Grep for files' })
    Util.set_mapping('n', '<Leader>Ff', function()
      apply_func_dir_under_cursor(builtin.files)
    end, { desc = 'Grep for files under cursor in file tree' })
    -- Find files in nvim home
    Util.set_mapping('n', '<Leader>@ff', function()
      builtin.files({ cwd = vim.fn.stdpath('config') })
    end, { desc = 'Find files in Neovim home directory' })

    Util.set_mapping('n', '<Leader>lg', builtin.live_grep, { desc = 'Fuzzy live grep' })
    Util.set_mapping('n', '<Leader>Lg', function()
      apply_func_dir_under_cursor(builtin.live_grep)
    end, { desc = 'Fuzzy live grep under cursor in file tree' })

    Util.set_mapping('n', '<Leader>bb', builtin.buffers, { desc = 'Grep for listed buffers' })

    Util.set_mapping('n', '<Leader>re', builtin.resume, {
      desc = 'Resume the previous fuzzy search operation'
    })

    Util.set_mapping('n', '<Leader>ld', builtin.lsp_document_diagnostics, {
      desc = 'Get diagnostics for current buffer'
    })
    Util.set_mapping('n', '<Leader>lref', builtin.lsp_references, {
      desc = 'Show LSP references for under cursor'
    })
  end

  -- Misc.
  Util.set_mapping('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
  Util.set_mapping('n', '[b', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' })

  Util.set_mapping('n', ']q', '<cmd>try | cnext | catch | cfirst | catch | endtry<CR>', {
    desc = 'Try to go to next item in qflist'
  })
  Util.set_mapping('n', '[q', '<cmd>try | cprevious | catch | clast | catch | endtry<CR>', {
    desc = 'Try to go to previous item in qflist'
  })
  Util.set_mapping('n', '<Space>qq', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid

    if qf_winid ~= 0 then
      vim.cmd('cclose')
    else
      vim.cmd('copen')
    end
  end, { desc = 'Toggle quickfix list' })

  Util.set_mapping('n', '<Space>h', '<cmd>helpclose<CR>')

  -- Util.set_mapping('n', '<Space>tt', function()
  --   vim.cmd('new')
  --   vim.cmd('term')
  --   vim.api.nvim_win_set_height(0, 15)
  -- end, { desc = 'Open terminal window' })
end

return M

