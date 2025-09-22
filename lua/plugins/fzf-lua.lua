local Util = require('util.util')

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { "nvim-mini/mini.icons" },
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
          formatter = 'path.filename_first',
          winopts = {
            preview = {
              vertical = "up:45%",
              horizontal = "right:61%",
              -- layout = 'horizontal'
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
          fzf_opts = {
            ['--with-nth'] = '2..,-1',
            ["--scheme"] = "path",
            ["--tiebreak"] = "index" },
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

