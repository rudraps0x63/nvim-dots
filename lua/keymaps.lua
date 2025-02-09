local M = {}
local Util = require('util.util')

M.setup = function()
  local nt_api = require('nvim-tree.api')
  local builtin = require('telescope.builtin')

  if nt_api ~= nil then
    Util.set_mapping('n', '<Leader>tt', nt_api.tree.toggle, { desc = 'Toggle file tree' })
    Util.set_mapping('n', '<Leader>T', nt_api.tree.open, { desc = 'Focus file tree, open if not' })
  end

  if builtin ~= nil then
    local apply_func_dir_under_cursor = function(builtin_func)
      local cursor_dir = nt_api.tree.get_node_under_cursor()

      if (cursor_dir ~= nil) and (cursor_dir['type'] == 'directory') then
        builtin_func({ cwd = cursor_dir['absolute_path'] })
      else
        vim.notify('Node under cursor in file tree not valid, defauling...', vim.log.levels.INFO)
        builtin_func()
      end
    end

    Util.set_mapping('n', '<Leader>ff', builtin.find_files, { desc = 'Grep for files' })
    Util.set_mapping('n', '<Leader>Ff', function()
      apply_func_dir_under_cursor(builtin.find_files)
    end, { desc = 'Grep for files under cursor in file tree' })

    Util.set_mapping('n', '<Leader>lg', builtin.live_grep, { desc = 'Fuzzy live grep' })
    Util.set_mapping('n', '<Leader>Lg', function()
      apply_func_dir_under_cursor(builtin.live_grep)
    end, { desc = 'Fuzzy live grep under cursor in file tree' })

    Util.set_mapping('n', '<Leader>bb', builtin.buffers, { desc = 'Grep for listed buffers' })

    Util.set_mapping('n', '<Leader>re', builtin.resume, { desc = 'Resume the previous fuzzy search operation' })
  end

  Util.set_mapping('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
  Util.set_mapping('n', '[b', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' })

  vim.keymap.set('n', '<Leader>2', '<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>', {
    desc = 'Try to go to next item in qflist'
  })
  vim.keymap.set('n', '<Leader>1', '<Cmd>try | cprevious | catch | clast | catch | endtry<CR>', {
    desc = 'Try to go to previous item in qflist'
  })

  Util.set_mapping('n', '<Space>tt', function()
    vim.cmd('new')
    vim.cmd('term')
    vim.api.nvim_win_set_height(0, 15)
  end, { desc = 'Open terminal window' })
end

return M

