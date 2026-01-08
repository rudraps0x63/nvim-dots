local Util = require('util.util')

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-mini/mini.icons', opts = {} },
    config = function()
      local fzf_lua = require('fzf-lua')

      fzf_lua.setup({
        { 'telescope' }, -- Base profile
        defaults = { -- "Global" picker defaults, applied when a picker is active
          actions = {
            ['<C-q>'] = fzf_lua.actions.set_qflsit,
            -- ['<C-i>'] = fzf_lua.win.toggle_preview,
            -- ['<C-v>'] = require('fzf-lua').actions.file_vsplit
          },
          prompt = '> ',
          cwd_prompt = false,
          -- formatter = 'path.filename_first',
          winopts = {
            width = 0.78,
            height = 0.9,
            preview = {
              vertical = "up:45%",
              horizontal = "right:59%",
              -- layout = 'flex'
            },
            on_create = function() -- Mapping is created WHEN a picker is active
              Util.set_mapping('t', '<C-p>', fzf_lua.win.toggle_preview, {
                silent = true, buffer = true, desc = 'Toggle fzf-lua preview'
              })
            end
          },
        },
        files = {
          cmd = "rg --files --hidden --ignore --glob='!.git'",
          -- cmd = "fd --hidden --type f --type l --exclude .git",
          -- formatter = { 'path.filename_first', 2 },
          fzf_opts = {
            -- ['--with-nth'] = '2..,-1',
            -- ["--multi"] = true,
            ["--scheme"] = "path",
            ["--tiebreak"] = "pathname,end,length"
            -- ["--tiebreak"] = "end"
          },
          winopts = {
            preview = {
              vertical = 'up:70%',      -- up|down:size
              -- layout = 'horizontal'
            }
          },
        },
        buffers = { ignore_current_buffer = false },
        diagnostics = { previewer = false }
      })
    end
  },
  {
    'elanmed/fzf-lua-frecency.nvim',
    lazy = false,
  },
}

