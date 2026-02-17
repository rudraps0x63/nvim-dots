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
  local fzf_lua = require_or_nil('fzf-lua')
  local snacks = require_or_nil('snacks')

  Util.set_mapping('n', '<Leader>wd', function()
    vim.ui.input({ prompt = 'Enter directory: ', completion = 'file' }, function(input)
      if input and vim.fn.isdirectory(input) then
        vim.cmd('lcd ' .. input)
      end
    end)
  end, { desc = "Set 'lcd' of current window" })

  -- Picker (Snacks)
  if snacks then
    -- Util.set_mapping('n', '<Leader>lg', snacks.picker.grep, { desc = 'Live grep' })
    -- Util.set_mapping('n', '<Leader>bg', function()
    --   snacks.picker.lines({ layout = { reverse = false } })
    -- end, { desc = 'Grep in current buffer' })
    -- Util.set_mapping('n', '<Leader>@lg', function()
    --   snacks.picker.grep({ cwd = vim.fn.stdpath('config') })
    -- end, { desc = 'Live grep' })
    --
    Util.set_mapping('n', '<Leader>ff', snacks.picker.files, { desc = 'Find files' })
    Util.set_mapping('n', '<Leader>Ff', function()
      vim.ui.input({ prompt = 'Enter directory: ', completion = 'file' }, function(input)
        if input and vim.fn.isdirectory(input) then
          snacks.picker.files({ cwd = input })
        end
      end)
    end, { desc = 'Find files via an input directory' })
    Util.set_mapping('n', '<Leader>@ff', function()
      snacks.picker.files({ cwd = vim.fn.stdpath('config') })
    end, { desc = 'Find files in config home directory' })
    --
    -- Util.set_mapping('n', '<Leader>ld', snacks.picker.diagnostics_buffer, { desc = 'LSP diagnostics' })
    -- Util.set_mapping('n', '<Leader>lref', snacks.picker.lsp_references, { desc = 'LSP references' })
    Util.set_mapping('n', '<Leader>ls', function()
      snacks.picker.lsp_symbols({ filter = { default = { 'Function' }}})
    end, { desc = 'LSP symbols (functions)' })
    --
    -- Util.set_mapping('n', '<Leader>re', snacks.picker.resume, { desc = 'Resume last picker' })
    --
    -- Util.set_mapping('n', '<Leader>li', snacks.picker.highlights, { desc = 'Pick highlights' })
    Util.set_mapping('n', '<Leader><Leader>', function() snacks.explorer() end, { desc = 'Toggle Snacks explorer' })
    -- Util.set_mapping('n', '<Leader>bb', fzf_lua.buffers, { desc = 'Pick buffers' })
  end

  -- Picker (FzfLua)
  if fzf_lua then
    -- fzf_lua.files = require('fzf-lua-frecency').frecency
    -- Util.set_mapping('n', '<Leader>ff', fzf_lua.files, { desc = 'Grep for files' })
    -- Util.set_mapping('n', '<Leader>ff', function()
    --   fzf_lua.files({ cwd_only = true, display_score = false })
    -- end, { desc = 'Find files' })

    -- Util.set_mapping('n', '<Leader>ff', fzf_lua.files, { desc = 'Find files' })
    -- Util.set_mapping('n', '<Leader>Ff', function()
    --   vim.ui.input({ prompt = 'Enter directory: ', completion = 'file' }, function(input)
    --     if input and vim.fn.isdirectory(input) then
    --       fzf_lua.files({ cwd = input, cwd_only = true })
    --     end
    --   end)
    -- end, { desc = 'Find files for input directory' })

    -- Find files in nvim home
    -- Util.set_mapping('n', '<Leader>@ff', function()
    --   fzf_lua.files({ cwd = vim.fn.stdpath('config'), cwd_only = true })
    -- end, { desc = 'Find files in Neovim home directory' })

    Util.set_mapping('n', '<Leader>lg', fzf_lua.live_grep, { desc = 'Live grep' })
    Util.set_mapping('n', '<Leader>bg', fzf_lua.grep_curbuf, { desc = 'Grep current buffer' })
    Util.set_mapping('v', '<Leader>lvg', fzf_lua.grep_visual, { desc = 'Grep selection' })
    Util.set_mapping('n', '<Leader>Lg', function()
      vim.ui.input({ prompt = 'Enter directory: ', completion = 'file' }, function(input)
        if input and vim.fn.isdirectory(input) then
          fzf_lua.live_grep({ cwd = input })
        end
      end)
    end, { desc = 'Live grep for input directory' })
    Util.set_mapping('n', '<Leader>@lg', function()
      fzf_lua.live_grep({ cwd = vim.fn.stdpath('config'), cwd_only = true })
    end, { desc = 'Live grep in Neovim home directory' })

    Util.set_mapping('n', '<Leader>bb', fzf_lua.buffers, { desc = 'Pick buffers' })

    Util.set_mapping('n', '<Leader>re', fzf_lua.resume, { desc = 'Resume last picker' })
    Util.set_mapping('n', '<Leader>ld', function()
      fzf_lua.lsp_document_diagnostics({ severity_only = 'error' })
    end, { desc = 'LSP document diags, error only' })
    Util.set_mapping('n', '<Leader>lD', fzf_lua.lsp_document_diagnostics, { desc = 'LSP document diags' })
    Util.set_mapping('n', '<Leader>lref', fzf_lua.lsp_references, { desc = 'LSP references under cursor' })

    Util.set_mapping('n', '<Leader>j', fzf_lua.jumps, { desc = 'Pick jumps' })
    Util.set_mapping('n', '<Leader>li', fzf_lua.highlights, { desc = 'Pick highlights' })
  end

  -- Common
  Util.set_mapping('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
  Util.set_mapping('n', '[b', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' })

  Util.set_mapping('n', ']q', '<cmd>try | cnext | catch | cfirst | catch | endtry<CR>', {
    desc = 'Try to go to next item in qflist'
  })
  Util.set_mapping('n', '[q', '<cmd>try | cprevious | catch | clast | catch | endtry<CR>', {
    desc = 'Try to go to previous item in qflist'
  })
  Util.set_mapping('n', '<Space>q', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid

    if qf_winid ~= 0 then
      vim.cmd('cclose')
    else
      vim.cmd('copen')
    end
  end, { desc = 'Toggle quickfix list' })

  Util.set_mapping('n', '<Space>h', '<cmd>helpclose<CR>')
end

return M

